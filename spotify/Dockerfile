FROM ubuntu:bionic
MAINTAINER Gary Hetzel <its@gary.cool>

RUN apt-get -qq update && apt-get install -qq -y libsass0 ca-certificates curl wget iputils-ping net-tools dnsutils dbus xvfb screen gnupg2
RUN curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - 
RUN echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
RUN apt-get -qq update && apt-get install -qq -y spotify-client
RUN apt-get clean all

