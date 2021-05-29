FROM node:14

# Create app directory
WORKDIR /usr/src/app
RUN pwd

COPY . .
RUN git submodule update --init --recursive

# check farmerless installed
RUN ls -la
RUN cd farmerless && ls -la

RUN npm install
RUN npm run build

EXPOSE 8000
CMD [ "npm", "start" ]
