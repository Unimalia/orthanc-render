FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    software-properties-common \
 && wget -qO - https://orthanc.uclouvain.be/debian/archive.key | gpg --dearmor -o /usr/share/keyrings/orthanc.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/orthanc.gpg] https://orthanc.uclouvain.be/debian/ bookworm main" > /etc/apt/sources.list.d/orthanc.list \
 && apt-get update \
 && apt-get install -y \
    orthanc \
    orthanc-dicomweb \
    orthanc-gdcm \
    orthanc-webviewer \
    orthanc-stone-webviewer \
    orthanc-explorer-2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY orthanc.json /etc/orthanc/orthanc.json

CMD ["Orthanc", "/etc/orthanc/orthanc.json"]