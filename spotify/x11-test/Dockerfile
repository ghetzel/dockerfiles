FROM ubuntu:bionic
MAINTAINER Gary Hetzel <its@gary.cool>

RUN apt-get -qq update && apt-get install -qqy xterm xauth
RUN apt-get clean all
ENV DISPLAY :0.0
CMD xterm
