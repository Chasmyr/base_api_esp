FROM node:18-alpine

RUN apk add --no-cache postgresql-client
RUN apk add --no-cache bash

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Generate prisma client
RUN npx prisma generate --schema=./prisma/schema.prisma

RUN chmod +x ./entrypoint.sh

# defined command to execute app
CMD ["sh", "./entrypoint.sh"]
