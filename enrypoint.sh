#!/bin/bash
cd /app

echo "----------------------------------"
echo "Waiting Database "
echo ""----------------------------------""

# Wait for the database to be ready
while ! pg_isready -h $PGHOST -p $PGPORT -q -U $PGUSER
do
  echo "$(date) - Waiting for database..."
  sleep 1
done

echo "----------------------------------"
echo "Database is ready!"
echo "----------------------------------"

echo "----------------------------------"
echo "Migration starting!"
echo "----------------------------------"

# Run Prisma migrations
if npx prisma migrate dev --name init --schema=prisma/schema.prisma; then
  echo "Bank migrations applied successfully."
else
  echo "Error applying migrations."
  exit 1
fi

echo "----------------------------------"
echo "Generate Prisma Client"
echo "----------------------------------"

npx prisma generate --schema=prisma/schema.prisma

echo "----------------------------------"
echo "Server is starting..."
echo "----------------------------------"

npm run dev

echo "----------------------------------"
echo "Server started!"
echo "----------------------------------"