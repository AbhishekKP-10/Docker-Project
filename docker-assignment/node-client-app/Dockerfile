FROM node:16.14.0-alpine
LABEL  maintainer_email="abhishek.kp@shadowfax.in"
LABEL maintainer_rollNumber="SF4472"
RUN mkdir -p /home/app
COPY . /home/app
WORKDIR /home/app
ENV CREATEDBY="ABHISHEK"
RUN npm install
ENTRYPOINT [ "node" ,"./src/app.js"]
EXPOSE 2000


