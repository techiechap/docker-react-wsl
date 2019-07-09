#Specify base image
FROM node:alpine as builder 

#Specify working directory
WORKDIR /app

#Copy Files
COPY package.json ./

#Dependencies to install
RUN npm install
COPY . .
RUN npm build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html



