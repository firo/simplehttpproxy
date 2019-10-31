FROM arm32v7/alpine:latest

# Building ARM images on DockerHub https://daehne.net/docker/dockerhub/github/2018/12/09/building-arm-images-on-docker-hub.html
ADD qemu-arm-static /usr/bin

RUN apk --no-cache --no-progress upgrade
RUN apk --no-cache --no-progress add bash 
RUN apk --no-cache --no-progress add curl
RUN apk --no-cache --no-progress add nodejs npm

WORKDIR /app
COPY package.json /app
COPY proxy.js /app
RUN npm install

CMD node index.js

EXPOSE 9000
