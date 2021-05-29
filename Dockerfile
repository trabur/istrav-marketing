FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Bundle source code
COPY . .
RUN git submodule update --init --recursive
COPY farmerless ./farmerless

RUN npm install
RUN npm run build

# Bundle app source
COPY . .

EXPOSE 8000
CMD [ "npm", "start" ]
