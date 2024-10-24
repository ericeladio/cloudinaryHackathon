FROM node:lts AS runtime
WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321
CMD ["sh", "-c", "echo PUBLIC_CLOUDINARY_CLOUD_NAME=$PUBLIC_CLOUDINARY_CLOUD_NAME && node ./dist/server/entry.mjs"]