FROM ubuntu:25.10

RUN apt update && apt install -y curl postgresql-client python3-pip python3-venv nodejs npm wget dnsutils netcat-openbsd vim jq iputils-ping tcpdump gpg   software-properties-common
RUN mkdir /usr/local/bin/venv && chown 1001:1001 /usr/local/bin/venv

USER 1001:1001

ENTRYPOINT ["tail", "-f", "/dev/null"]

