FROM debian:10

RUN apt-get -qq update && apt-get install -qqy openssh-server openssh-client openssh-sftp-server
RUN apt-get clean
RUN rm /etc/ssh/*_key*
RUN mkdir -p /run/sshd && chmod 755 /run/sshd
COPY init /init
RUN chmod +x /init

EXPOSE 22
WORKDIR "/root"
CMD ["/init"]
