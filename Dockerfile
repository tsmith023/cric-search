FROM node:20.3.1-buster-slim AS npm-deps
WORKDIR /var/www/cric/
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "dev"]

FROM npm-deps as npm-build
RUN npm run build
CMD ["npm", "start"]
