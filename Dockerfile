# Specify a base image
FROM node:16-alpine as builder

# Install some dependencies
WORKDIR /app
COPY package.json .

RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder app/build /usr/share/nginx/html