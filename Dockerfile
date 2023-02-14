FROM --platform=linux/amd64 ubuntu:22.04

ENV TZ 'Asia/Seoul'
ENV DEBIAN_FRONTEND noninteractive

RUN echo $TZ > /etc/timezone && \
apt-get update && apt-get install -y locales tzdata && \
rm /etc/localtime && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y --no-install-recommends \
    curl vim wget && \
    apt-get clean

# Install packages
RUN apt-get -y install openssh-server && \
    apt-get -y install vim

# set locale ko_KR
RUN locale-gen ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

CMD /bin/bash

#https://hub.docker.com/_/ubuntu

