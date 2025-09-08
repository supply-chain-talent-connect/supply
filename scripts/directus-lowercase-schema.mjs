#!/usr/bin/env node
/**
 * Directus schema lowercaser
 * - Exports schema snapshot
 * - Converts collection + field keys (and schema names) to lowercase
 * - Writes backup + transformed snapshots
 * - Optionally applies transformed snapshot back to Directus with --apply
 *
 * Env vars (or flags):
 *   DIRECTUS_URL   (or --url)
 *   DIRECTUS_TOKEN (or --token) - admin token
 *
 * Usage:
 *   node scripts/directus-lowercase-schema.mjs                 # dry run, write files only
 *   node scripts/directus-lowercase-schema.mjs --apply         # apply changes
 *   node scripts/directus-lowercase-schema.mjs --url http://10.0.20.3:8055 --token <ADMIN_TOKEN> --apply
 */

import fs from 'node:fs';
import path from 'node:path';

// Simple arg parser
const args = process.argv.slice(2);
const has = (f) => args.includes(f);
const get = (f, def) => {
  const i = args.indexOf(f);
  return i !== -1 && args[i + 1] ? args[i + 1] : def;
};

const APPLY = has('--apply');
const DIRECTUS_URL = get('--url', process.env.DIRECTUS_URL || '').replace(/\/$/, '');
const DIRECTUS_TOKEN = get('--token', process.env.DIRECTUS_TOKEN || '');

if (!DIRECTUS_URL) {
  console.error('Missing DIRECTUS_URL (env or --url).');
  process.exit(1);
}
if (!DIRECTUS_TOKEN) {
  console.error('Missing DIRECTUS_TOKEN (env or --token).');
  process.exit(1);
}

const SNAP_DIR = path.join(process.cwd(), 'directus-snapshots');
fs.mkdirSync(SNAP_DIR, { recursive: true });

const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
const backupFile = path.join(SNAP_DIR, `snapshot-${timestamp}-original.json`);
const outFile = path.join(SNAP_DIR, `snapshot-${timestamp}-lowercase.json`);

async function fetchJSON(url, options = {}) {
  const res = await fetch(url, {
    ...options,
    headers: {
      'Authorization': `Bearer ${DIRECTUS_TOKEN}`,
      'Content-Type': 'application/json',
      ...(options.headers || {}),
    },
  });
  if (!res.ok) {
    const text = await res.text().catch(() => '');
    throw new Error(`HTTP ${res.status} ${res.statusText}: ${text}`);
  }
  return res.json();
}

function toLowerKey(v) {
  if (typeof v !== 'string') return v;
  return v.toLowerCase();
}

function buildMaps(data) {
  const collectionMap = new Map();
  const fieldMap = new Map();

  const isSystem = (name) => name.startsWith('directus_');

  for (const c of data.collections || []) {
    const oldName = c.collection;
    const newName = isSystem(oldName) ? oldName : toLowerKey(oldName);
    if (oldName !== newName) collectionMap.set(oldName, newName);
  }

  for (const f of data.fields || []) {
    const coll = f.collection;
    if (isSystem(coll)) continue;
    const oldField = f.field;
    const newField = toLowerKey(oldField);
    if (oldField !== newField) {
      if (!fieldMap.has(coll)) fieldMap.set(coll, new Map());
      fieldMap.get(coll).set(oldField, newField);
    }
  }

  return { collectionMap, fieldMap };
}

function transformSnapshot(snapshot) {
  const hasData = !!snapshot?.data;
  const data = hasData ? structuredClone(snapshot.data) : structuredClone(snapshot);
  const { collectionMap, fieldMap } = buildMaps(data);

  // Helper to map collection names
  const mapColl = (name) => collectionMap.get(name) || name;
  // Helper to map field names by (original) collection
  const mapField = (coll, field) => {
    const m = fieldMap.get(coll);
    return m && m.get(field) ? m.get(field) : field;
  };

  // Collections
  for (const c of data.collections || []) {
    const oldColl = c.collection;
    const newColl = mapColl(oldColl);
    c.collection = newColl;
    if (c.schema && typeof c.schema.name === 'string') {
      c.schema.name = toLowerKey(c.schema.name);
    }
  }

  // Fields
  for (const f of data.fields || []) {
    const oldColl = f.collection;
    const newColl = mapColl(oldColl);
    const oldField = f.field;
    const newField = mapField(oldColl, oldField);

    f.collection = newColl;
    f.field = newField;
    if (f.schema && typeof f.schema.name === 'string') {
      f.schema.name = toLowerKey(f.schema.name);
    }
  }

  // Relations
  for (const r of data.relations || []) {
    const oldColl = r.collection;
    const oldRelColl = r.related_collection;
    const oldField = r.field;

    r.collection = mapColl(oldColl);
    r.related_collection = mapColl(oldRelColl);
    r.field = mapField(oldColl, oldField);

    // Tidy up meta references if present
    if (r.meta) {
      if (r.meta.many_collection) r.meta.many_collection = mapColl(r.meta.many_collection);
      if (r.meta.one_collection) r.meta.one_collection = mapColl(r.meta.one_collection);
      if (r.meta.many_field) r.meta.many_field = mapField(oldColl, r.meta.many_field);
      if (r.meta.one_field) r.meta.one_field = mapField(oldRelColl, r.meta.one_field);
    }
  }

  const transformedFull = hasData ? { ...snapshot, data } : data;
  return { transformed: transformedFull, collectionMap, fieldMap, baseData: data };
}

function summarizeMaps(collectionMap, fieldMap) {
  const collChanges = Array.from(collectionMap.entries());
  const fieldChanges = [];
  for (const [coll, m] of fieldMap.entries()) {
    for (const [oldF, newF] of m.entries()) {
      fieldChanges.push({ collection: coll, from: oldF, to: newF });
    }
  }
  return { collChanges, fieldChanges };
}

async function main() {
  console.log(`Fetching schema snapshot from ${DIRECTUS_URL} (with hash)...`);
  const snapshot = await fetchJSON(`${DIRECTUS_URL}/schema/snapshot?format=json&hash=true`);

  fs.writeFileSync(backupFile, JSON.stringify(snapshot, null, 2));
  console.log(`Backup written: ${backupFile}`);

  const { transformed, collectionMap, fieldMap, baseData } = transformSnapshot(snapshot);
  fs.writeFileSync(outFile, JSON.stringify(transformed, null, 2));
  console.log(`Lowercased snapshot written: ${outFile}`);

  const { collChanges, fieldChanges } = summarizeMaps(collectionMap, fieldMap);
  console.log('\nPlanned changes:');
  if (collChanges.length) {
    console.log(' Collections:');
    for (const [from, to] of collChanges) console.log(`  - ${from} -> ${to}`);
  } else {
    console.log(' Collections: (none)');
  }
  if (fieldChanges.length) {
    console.log(' Fields:');
    for (const f of fieldChanges) console.log(`  - ${f.collection}.${f.from} -> ${f.collection}.${f.to}`);
  } else {
    console.log(' Fields: (none)');
  }

  if (!APPLY) {
    console.log('\nDry run complete. Review the lowercased snapshot.');
    console.log('To apply, rerun with --apply');
    return;
  }

  console.log('\nApplying lowercased snapshot via /schema/apply ...');
  // Keep the server-provided hash to satisfy precondition
  const payload = typeof transformed?.hash !== 'undefined' ? transformed : { ...transformed, hash: snapshot.hash };
  const applyRes = await fetchJSON(`${DIRECTUS_URL}/schema/apply`, {
    method: 'POST',
    body: JSON.stringify(payload),
  });
  console.log('Apply response:', JSON.stringify(applyRes, null, 2));

  // Clear cache to ensure admin app/API reflect changes immediately
  try {
    await fetchJSON(`${DIRECTUS_URL}/utils/cache/clear`, { method: 'POST' });
    console.log('Cache cleared.');
  } catch (e) {
    console.warn('Cache clear failed (non-fatal):', e.message);
  }

  console.log('Done.');
}

main().catch((err) => {
  console.error('Error:', err.message);
  process.exit(1);
});
