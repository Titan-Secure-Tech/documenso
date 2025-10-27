/**
 * Vercel serverless function entry point for Hono + React Router
 */
import handle from 'hono-react-router-adapter/node';

import server from '../apps/remix/build/server/hono/server/router.js';
import * as build from '../apps/remix/build/server/index.js';

const handler = handle(build, server);

export default handler.fetch;
