FROM debian:bullseye

#ADD "https://github.com/e1z0/Framebuffer-browser/raw/main/debian/bullseye/fbrowser-bin_1.0.0_amd64.deb" "/fbrowser.deb"
ADD "https://github.com/e1z0/Framebuffer-browser/raw/main/debian/bullseye/fbrowser-bin-kiosk_1.0.0_amd64.deb" "/fbrowser.deb"

RUN ["bash", "-c", "main(){ \
    dpkg -i /fbrowser.deb; \
    apt update; \
    apt -y -f install; \
    dpkg -i /fbrowser.deb; \
}; main"]

RUN ["rm", "/fbrowser.deb"]


CMD ["bash", "-c", "main(){ \
    if [ -n \"${TZ:-}\" ]; then \
        ln -snf \"/usr/share/zoneinfo/${TZ}\" /etc/localtime; \
        echo \"${TZ}\" > /etc/timezone; \
    fi; \
    if [ ! -f /root/.config/fbrowser/config ]; then \
        mkdir -p /root/.config/fbrowser; \
        env | grep '^FBROWSER_' | while IFS='=' read key val; do \
            echo \"${key:9}=${val}\" >> /root/.config/fbrowser/config; \
        done; \
    fi; \
    exec fbrowser \"${URL}\"; \
}; main"]
