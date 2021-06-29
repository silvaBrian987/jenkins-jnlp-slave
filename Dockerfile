FROM jenkins/agent:latest

USER root

RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" \
    && apt-get update \ 
    && apt-get install -y docker-ce-cli \
    && apt-get autoclean

RUN mkdir /home/jenkins/workspace && \
    chown -R jenkins:jenkins /home/jenkins/workspace && \
    chown -R 777 /home/jenkins/workspace

USER jenkins
