FROM jodogne/orthanc-plugins:latest

COPY orthanc.json /etc/orthanc/orthanc.json

EXPOSE 8042
EXPOSE 4242

CMD ["/usr/sbin/Orthanc", "/etc/orthanc/orthanc.json"]