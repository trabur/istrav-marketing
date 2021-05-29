FROM node:14

# Create app directory
WORKDIR /usr/src/app
RUN pwd


# Bundle source code
RUN ls -la
COPY . .
RUN ls -la
RUN git submodule update --init --recursive

# Bundle farmerless
COPY . .
RUN ls -la

RUN npm install
RUN ls -la
RUN npm run build

# Bundle app source
COPY . .

EXPOSE 8000
CMD [ "npm", "start" ]
