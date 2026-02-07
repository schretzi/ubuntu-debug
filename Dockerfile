FROM ubuntu:25.10

RUN apt update && apt install -y curl postgresql-client python3-pip python3-venv nodejs npm wget dnsutils netcat-openbsd vim jq iputils-ping tcpdump gpg   software-properties-common
RUN mkdir -p /etc/apt/keyrings/ && touch /etc/apt/keyrings/neo.gpg && wget -O - https://debian.neo4j.com/neotechnology.gpg.key | gpg --dearmor > /etc/apt/keyrings/neo.gpg
RUN echo 'deb [signed-by=/etc/apt/keyrings/neo.gpg]  https://debian.neo4j.com stable latest' | tee -a /etc/apt/sources.list.d/neo4j.list;
RUN apt update && apt install -y neo4j && rm -rf /var/lib/apt/lists/*
RUN npm install -g @mermaid-js/mermaid-cli 
RUN mkdir /usr/local/bin/venv && chown 1001:1001 /usr/local/bin/venv

USER 1001:1001
RUN python3 -m venv /usr/local/bin/venv && /usr/local/bin/venv/bin/pip install neo4j 

ENTRYPOINT ["tail", "-f", "/dev/null"]

