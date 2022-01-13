FROM node:12-alpine

WORKDIR /usr/src/app

COPY ./app/package*.json ./

RUN npm i

COPY ./app .

EXPOSE 8080

CMD ["npm", "start"]