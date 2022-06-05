FROM node:current-alpine as builder

WORKDIR /app
COPY package.json .

RUN yarn install
COPY . . 
RUN yarn run build

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html
