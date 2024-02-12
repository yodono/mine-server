FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft

COPY server start.sh ./

RUN chmod +x start.sh

CMD ["./start.sh"]
