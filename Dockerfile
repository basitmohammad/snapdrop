FROM ubuntu
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN sh -c 'curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -'
RUN apt-get install nodejs git -y
COPY . /src
RUN cd /src
RUN ln -s /usr/bin/nodejs /usr/sbin/node
RUN npm install -g npm
RUN npm install -g polymer-cli
RUN mkdir my-app
RUN cd my-app
RUN polymer init polymer-3-starter-kit
RUN npm install -g gulp bower
RUN cd /src; npm install
RUN cd /src; bower install --allow-root
RUN npm start
EXPOSE 3002
WORKDIR /src
CMD [ "bash", "start.sh" ]
