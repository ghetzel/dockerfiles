FROM fedora:33
MAINTAINER Gary Hetzel <its@gary.cool>

ENV TERM xterm-256color
RUN yum install -y castget && yum clean all
RUN mkdir /config
ADD castgetrc /config/castgetrc

CMD ["/bin/castget", "--verbose", "--rcfile", "/config/castgetrc"]

