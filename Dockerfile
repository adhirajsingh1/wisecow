FROM ubuntu:20.04


ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \
    fortune cowsay netcat dos2unix \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY wisecow.sh .


RUN dos2unix wisecow.sh


RUN chmod +x wisecow.sh


EXPOSE 4499


CMD ["./wisecow.sh"]
