FROM ubuntu:24.04

MAINTAINER Athlon, <konrad.figura@icloud.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl lib32gcc1 lib32stdc++6 libc6 libgl1-mesa-glx libxcursor1 libxrandr2 libc6-dev libgcc-4.8-dev python3 python3-pip wget && \
    useradd -d /home/container -m container

RUN curl -o /home/container/renew_unturned.py https://raw.githubusercontent.com/Athlon007/MyScripts/refs/heads/master/Python/Unturned/renew_unturned.py

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

RUN pip3 install requests

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
