#Stage 1
FROM node:19-alpine as react-builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

#Stage 2
FROM nginx:1.23.3-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=react-builder /app/build .
ENTRYPOINT ["nginx", "-g", "daemon off;"]
