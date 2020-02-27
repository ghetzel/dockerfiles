FROM ghetzel/diecast:1.17.14

COPY init /config/init
RUN chmod +x /config/init
COPY diecast.yml /config/diecast.yml

EXPOSE 28419
ENV LOGLEVEL warning
ENV DIECAST_CONFIG /config/diecast.yml
ENV DIECAST_RENDER_FILE /config/template

WORKDIR "/config"
ENTRYPOINT ["/config/init"]
