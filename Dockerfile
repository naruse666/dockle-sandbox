# syntax=docker/dockerfile:1

FROM node:21-alpine3.17
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000

