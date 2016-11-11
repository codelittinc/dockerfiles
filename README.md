Dockerfiles for Codelitt Docker images
===========

#Node images
Specify your volumes in docker-compose as such
```
    build:
      context: .
      dockerfile: Dockerfile.development
    volumes:
      - ./:/share
      - /share/node_modules
```

Here is a full example of a dockerfile we use for the front end of codelitt.com:

```
version: '2'
services:
  frontend:
    container_name: codelitt-v2
    tty: true
    stdin_open: true
    build:
      context: .
      dockerfile: Dockerfile.development
    volumes:
      - ./:/share
      - /share/node_modules
    ports:
      - "8080:8080"
```

This uses a data volume to store all the `node_modules` as data 
volumes copy in the data from the built docker image before 
mounting. 

You can find issues when docker builds the image if the volumes are
mounted after a build from the empty host as it will write over the build. 


