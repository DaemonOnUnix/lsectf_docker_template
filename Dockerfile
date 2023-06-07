# This is a dockerfile for a CTF challenge
# Uses a alpine linux image with a complete bash shell (not busybox)
FROM alpine:latest

ENV CHALL_NAME="chall"

RUN mkdir /chall && mkdir /lib64 && ln -s /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /chall

COPY ./src/dist /chall
RUN chmod +x /chall/${CHALL_NAME}

RUN ln -s /chall/libc.so /lib64/libc.so.6

EXPOSE 1337

RUN apk add --no-cache bash && rm /bin/sh && ln -s /bin/bash /bin/sh && apk add --no-cache nmap-ncat

SHELL ["/bin/bash", "-c"]

ENV LD_LIBRARY_PATH="/chall:/lib64:/lib:/usr/lib:${LD_LIBRARY_PATH}"
CMD ncat -lnvp 1337 -e "/bin/sh -c /chall/${CHALL_NAME}"
