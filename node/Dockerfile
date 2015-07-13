FROM node
MAINTAINER  David Greiner <david@ultitech.de>

RUN mkdir /src

WORKDIR /src
ADD app/package.json /src/package.json
ADD app/server.js /src/server.js
ADD app/modules /src/modules
RUN npm install

EXPOSE 3000

CMD node server.js