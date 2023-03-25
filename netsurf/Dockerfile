FROM debian:latest

ENV HOME=/root
ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update \
    && apt-get install -y \
        wget \
        sudo \
        libsdl1.2debian \
        libsdl1.2-dev


WORKDIR "/root"
RUN ["wget", "-O", "/root/.profile", "https://git.netsurf-browser.org/netsurf.git/plain/docs/env.sh"]
RUN ["bash", "--login", "-c", "yes | ns-package-install"]
RUN ["bash", "--login", "-c", "ns-clone"]
RUN ["bash", "--login", "-c", "ns-pull-install"]
RUN ["bash", "--login", "-c", "cd /root/dev-netsurf/workspace/netsurf && make TARGET=framebuffer"]
RUN ["rm", "/root/.profile"]
RUN ["cp", "/root/dev-netsurf/workspace/netsurf/nsfb", "/usr/bin/nsfb"]
RUN ["rm", "-rf", "/root/dev-netsurf"]

WORKDIR /root
CMD ["bash", "-c", "nsfb -f ${NETSURF_FRONTEND:-sdl} -w ${NETSURF_WIDTH:-800} -h ${NETSURF_HEIGHT:-480} -b ${NETSURF_BPP:-32} \"${NETSURF_URL:-about:blank}\""]
