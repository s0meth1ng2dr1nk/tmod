FROM debian:bullseye-slim
RUN mkdir -p /tmod/tmodloader
COPY entrypoint.sh /tmod
RUN apt update && \
    apt install -y \
        libicu-dev \
        tmux \
        unzip \
        wget \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://github.com/tModLoader/tModLoader/releases/latest/download/tModLoader.zip -P /tmod && \
    unzip /tmod/tModLoader.zip -d /tmod/tmodloader && \
    rm -f /tmod/tModLoader.zip && \ 
    chmod u+x /tmod/entrypoint.sh
EXPOSE 7777
ENTRYPOINT [ "/tmod/entrypoint.sh" ]
