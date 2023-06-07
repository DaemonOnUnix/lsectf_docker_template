# How to up a challenge

## Configure the files

- in ./src/dist/ : add all necessary shared libraries
- in ./src/dist/ : add the flag file 
- in ./src/ : add all necessary source files
- in ./src/ : add a Makefile/edit the existing one. The default target should create a binary in dist/ named after the challenge
- in Dockerfile : edit the CMD to run the binary

## Build the image

```bash
docker build -t <image_name> .
```

## Run the container

```bash
docker run -d -p <port>:1337 <image_name>
```

## Test the challenge

```bash
nc localhost <port>
```
