# Golang Dockerfiles

Provides boilerplate Dockerfiles to work with modern go application.
Using the power of multistage build. 

It expects the code to be in the same folder as the docker files

# To use it 

- Go mod (vendored packages):
    
        `docker build -f Dockerfile-module .`

- Go std:
    
        `docker build .`