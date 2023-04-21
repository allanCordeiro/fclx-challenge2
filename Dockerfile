FROM node:19-slim

WORKDIR /home/node/app
RUN chown -R node:node /home/node/app

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

COPY package*.json ./
RUN npm install
USER node


CMD ["npm", "run", "dev"]