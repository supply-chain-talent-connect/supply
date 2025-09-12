// Directus initialization script to ensure admin access
const bcrypt = require('bcryptjs');

async function init() {
  const { Directus } = require('@directus/sdk');
  const directus = new Directus(process.env.PUBLIC_URL || 'http://localhost:8055');
  
  // Wait for database to be ready
  const maxRetries = 30;
  let retries = 0;
  
  while (retries < maxRetries) {
    try {
      // Try to connect to database
      await directus.server.ping();
      console.log('Database connected, initializing admin user...');
      break;
    } catch (error) {
      retries++;
      console.log(`Waiting for database... (${retries}/${maxRetries})`);
      await new Promise(resolve => setTimeout(resolve, 2000));
    }
  }
  
  // Create or update admin user with known password
  const adminEmail = process.env.ADMIN_EMAIL || 'admin@example.com';
  const adminPassword = process.env.ADMIN_PASSWORD || 'admin123';
  
  try {
    // Generate password hash using Directus's method
    const argon2 = require('argon2');
    const hash = await argon2.hash(adminPassword);
    
    // Direct database update
    const knex = require('knex')({
      client: 'pg',
      connection: {
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_DATABASE,
      }
    });
    
    // Check if admin exists
    const admin = await knex('directus_users').where('email', adminEmail).first();
    
    if (admin) {
      // Update password
      await knex('directus_users')
        .where('email', adminEmail)
        .update({
          password: hash,
          status: 'active'
        });
      console.log(`Admin password updated for ${adminEmail}`);
    } else {
      // Create admin
      const adminRole = await knex('directus_roles').where('name', 'Administrator').first();
      
      await knex('directus_users').insert({
        id: knex.raw('gen_random_uuid()'),
        email: adminEmail,
        password: hash,
        first_name: 'Admin',
        last_name: 'User',
        status: 'active',
        role: adminRole ? adminRole.id : null
      });
      console.log(`Admin user created: ${adminEmail}`);
    }
    
    await knex.destroy();
    console.log('Initialization complete');
  } catch (error) {
    console.error('Initialization error:', error);
  }
}

init();