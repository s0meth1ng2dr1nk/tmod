FROM debian:trixie-slim
ARG TMOD_URL=https://github.com/tModLoader/tModLoader/releases/latest/download/tModLoader.zip
ENV TMOD_LIB_DIR=/tmod/lib
WORKDIR ${TMOD_LIB_DIR}
COPY entrypoint.sh ${TMOD_LIB_DIR}
RUN apt-get update && \
    apt-get install -y \
        libicu-dev \
        tmux \
        wget \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget ${TMOD_URL} && \
    TMOD_FILE=$(basename ${TMOD_URL}) && \
    unzip ${TMOD_FILE} && \
    rm -f ${TMOD_FILE} && \
    chmod u+x entrypoint.sh
EXPOSE 7777
ENTRYPOINT [ "./entrypoint.sh" ]
