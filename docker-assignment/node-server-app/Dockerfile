FROM alpine:latest
LABEL  maintainer_email="abhishek.kp@shadowfax.in"
LABEL maintainer_rollNumber="SF4472"
RUN apk add --update nodejs npm
RUN npm --version
RUN node --version
RUN npm cache clean --force
RUN mkdir -p /home/app
COPY . /home/app
WORKDIR /home/app
RUN npm install
ENTRYPOINT [ "node" ,"./src/app.js"]


