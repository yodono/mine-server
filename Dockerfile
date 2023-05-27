FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openjdk-17-jdk
WORKDIR /minecraft
COPY /server start.sh .
RUN chmod +x start.sh
CMD ["/bin/bash", "-c", "./start.sh"]
