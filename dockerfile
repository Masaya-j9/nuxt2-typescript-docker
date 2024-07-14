FROM node:lts-bookworm-slim

RUN npm install -g @vue/cli nuxt create-nuxt-app

ENV HOST 0.0.0.0
EXPOSE 3000