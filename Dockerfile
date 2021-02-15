FROM brutalgg/ubuntu-base

RUN \
# Update and get dependencies
    apt-get update && \
    apt-get install -y \
    apt-cacher-ng \
    && \
# Cleanup
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf var/tmp/*

EXPOSE 3142/tcp
VOLUME /config
VOLUME /data

COPY root/ /

WORKDIR /config