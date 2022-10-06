# pull image
FROM cypress/browsers:node18.6.0-chrome105-ff104
# make directory inside container
RUN mkdir /app
WORKDIR /app
# copy cypress code from host to container
COPY . /app
# execute the tests
RUN npm install
RUN $(npm bin)/cypress verify
RUN $(npm bin)/cypress run --browser firefox
RUN $(npm bin)/cypress run --browser chrome
RUN $(npm bin)/cypress run --browser edge
 
 
#----------------------------Config Two--------------------------
 
# Chrome 100 & Firefox 99
FROM cypress/browsers:node14.19.0-chrome100-ff99-edge
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN npm install
RUN $(npm bin)/cypress verify
RUN $(npm bin)/cypress run --browser firefox
RUN $(npm bin)/cypress run --browser chrome
RUN $(npm bin)/cypress run --browser edge