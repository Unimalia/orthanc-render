FROM orthancteam/orthanc:latest

# Installa plugin Stone Viewer
RUN apt-get update && apt-get install -y orthanc-stone-webviewer

COPY orthanc.json /etc/orthanc/orthanc.json