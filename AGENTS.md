# Repository Guidelines

## Project Structure & Module Organization
- `src/`: React + TypeScript app (Mantine UI). Keep UI in `components/`, helpers in `lib/`, and avoid editing `src/generated/**` (Prisma client output).
- `public/`: Static assets and i18n files at `public/locales/<lng>/translation.json`.
- `prisma/`: Prisma schema (`prisma/schema.prisma`) that generates the client into `src/generated/prisma`.
- `deployments/`: Service manifests and supporting files for auxiliary apps.
- Docker/CI: `Dockerfile*`, `docker-compose*.yml`, and `cloudbuild.yaml` for Cloud Run.

## Build, Test, and Development Commands
- `npm run dev`: Start Vite dev server on `:5173`.
- `npm run build`: Type-check and create production build (`dist/`).
- `npm run preview`: Serve the built app locally.
- `npm run lint` | `npm run lint:fix`: Lint (and auto-fix) the codebase.
- `npm run type-check`: TypeScript no‑emit check.
- Docker: `npm run docker:build`, `npm run docker:run`, or `npm run docker:compose:up` for containerized runs.
- Prisma: Regenerate client after schema changes with `npx prisma generate`.

## Coding Style & Naming Conventions
- TypeScript, 2‑space indent, prefer explicit types at boundaries.
- i18n: No literal UI strings. Use `useTranslation()` and keys (see `eslint-plugin-i18next` rules). Example: `t('app.getStarted')`.
- Filenames: `PascalCase` for components, `camelCase` for utilities, `kebab-case` for non‑TS assets.
- Keep React components small and focused; colocate styles next to components.

## Testing Guidelines
- No formal test suite yet. If adding tests, prefer Vitest + React Testing Library.
- Place tests next to sources (`Component.test.tsx`) or under `src/__tests__/`.
- Aim for meaningful coverage of hooks, utilities, and critical UI flows.

## Commit & Pull Request Guidelines
- Commits: Imperative, concise subjects (e.g., "Fix linting configuration", "Add Mantine setup"). Group related changes.
- PRs: Include a clear summary, screenshots for UI changes, linked issues, and notes on breaking changes or migrations (e.g., Prisma updates).
- Keep diffs focused; pass `lint` and `type-check` before opening.

## Security & Configuration
- Env: Use `.env.development`/`.env.production`; never commit secrets. Key vars: `DATABASE_URL`, storage bucket settings.
- Cloud: Secrets are managed via Google Secret Manager and injected in Cloud Run (`cloudbuild.yaml`).
- Scripts like `update_umami_secret.sh` assume GCP auth; avoid running outside GCP context.

