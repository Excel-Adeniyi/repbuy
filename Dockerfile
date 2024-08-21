FROM node:20.15.0-alpine3.20
WORKDIR /usr/app
COPY package.json /usr/app/
COPY .env /usr/app/
RUN npm install
# Install SQLite
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev
RUN npm install -g nodemon --save-dev
COPY ./ /usr/app/
EXPOSE 3000
CMD ["nodemon", "src/index.ts"]