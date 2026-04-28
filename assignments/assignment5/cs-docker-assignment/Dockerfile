FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y \
    git \
    lynx \
    gcc \
    build-essential

RUN git clone https://github.com/mit-pdos/xv6-public.git /opt/xv6-public

COPY hello.c /opt/hello.c

WORKDIR /opt

RUN gcc hello.c -o hello

CMD ["./hello"]
