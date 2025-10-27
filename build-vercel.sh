#!/usr/bin/env bash
set -e

echo "Generating Prisma client..."
cd packages/prisma && npx prisma generate && cd ../..

echo "Extracting and compiling translations..."
npm run translate

echo "Building application..."
cd apps/remix
npm run build:app
npm run build:server

echo "Copying server files..."
cp server/main.js build/server/main.js
mkdir -p build/server/hono/packages/lib
cp -r ../../packages/lib/translations build/server/hono/packages/lib/translations

echo "Build complete!"
