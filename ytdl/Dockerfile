FROM ubuntu:eoan
MAINTAINER Gary Hetzel <its@gary.cool>

ENV TERM xterm-256color
RUN apt-get -qq update && apt-get install -qq -y python3-pip proxychains4 tor obfsproxy curl net-tools ffmpeg && apt-get clean all
RUN pip3 install -U youtube_dl

