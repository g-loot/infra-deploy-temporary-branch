FROM ubuntu
RUN apt-get update && \
    apt-get install -y jq wget curl && \
    rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
COPY . .
ENTRYPOINT ["/get-deploy-file.sh"]
