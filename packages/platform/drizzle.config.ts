import { defineConfig } from 'drizzle-kit';

import { appEnvVariables } from '#server/env.ts';

const { DB_NAME, DB_USER, DB_HOST, DB_PORT, DB_PASSWORD } = appEnvVariables;

export default defineConfig({
  dbCredentials: {
    host: DB_HOST,
    port: DB_PORT,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_NAME,
    //TODO: use `tls: true` when drizzle-kit supports Bun.sql as the driver: https://github.com/drizzle-team/drizzle-orm/issues/4122
    ssl: {
      rejectUnauthorized: false,
    },
  },
  dialect: 'postgresql',
  schema: ['./server/drizzle/**/*.ts'],
  schemaFilter: ['public', 'vault'],
  out: './drizzle',
  breakpoints: true,
});
