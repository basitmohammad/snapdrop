FROM ubuntu
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs npm -y
COPY . /src
RUN cd /src
RUN rm /usr/bin/node
RUN ln -s /usr/bin/nodejs /usr/sbin/node
RUN npm install -g gulp bower forever
RUN cd /src; npm install
RUN cd /src; bower install
EXPOSE 3002
CMD [ "forever", "start", "/src/index.js" ]
