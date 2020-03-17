FROM ubuntu:bionic
MAINTAINER Gary Hetzel <its@gary.cool>

RUN apt-get -qq update && apt-get install -qq -y python3-pip proxychains tor obfsproxy curl && apt-get clean all
RUN pip3 install -U youtube_dl

