FROM ubuntu:20.04
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y



RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    gnupg \
    software-properties-common \
    python3-pip
    
RUN DEBIAN_FRONTEND=noninteractive mkdir -p /etc/apt/keyrings && \
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN DEBIAN_FRONTEND=noninteractive echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -qq --no-install-recommends \
  docker-ce docker-ce-cli containerd.io docker-compose-plugin && pip install urllib3 chardet docker-compose


RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ENV TARGETARCH=linux-x64

WORKDIR /azp

COPY ./start.sh .
COPY ./cache-images.s? .
RUN chmod +x cache-images.s?
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]