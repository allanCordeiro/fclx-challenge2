FROM node:19-slim

WORKDIR /home/node/app

COPY package.json package-lock.json ./
RUN \
    if [ -f package-lock.json]; then npm ci; \
    else echo "lockfile not found" && npm install; \
    fi

COPY . .

RUN chown -R node:node /home/node/app
USER node

RUN npx prisma generate
CMD \
    if [ -f package-lock.json]; then npm run build; \
    else npm run dev; \
    fi


