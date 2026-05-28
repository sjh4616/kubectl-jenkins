FROM jenkins/jenkins:lts-jdk21
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl sudo wget ca-certificates gnupg \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY ./jenkins-in-docker-install.sh /tmp/jenkins-in-docker-install.sh
RUN chmod +x /tmp/jenkins-in-docker-install.sh && /tmp/jenkins-in-docker-install.sh \
    && rm -f /tmp/jenkins-in-docker-install.sh
RUN groupadd -g 999 docker_host || true && usermod -aG docker_host jenkins
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/
EXPOSE 8080
EXPOSE 50000
USER jenkins
