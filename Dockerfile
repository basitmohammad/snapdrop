FROM ubuntu
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs npm -y
COPY . /src
RUN cd /src
RUN npm install -g gulp bower forever
RUN npm install
RUN bower install
EXPOSE 3002
CMD [ "forever", "start", "index.js" ]
