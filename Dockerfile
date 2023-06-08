FROM node:14-alpine

RUN mkdir -p /var/www/nuxt-app
WORKDIR /var/www/nuxt-app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

ENV HOST=0.0.0.0
ENV PORT=3010

EXPOSE 3010
CMD ["npm", "start"]