FROM drwetter/testssl.sh:3.0

ADD run.sh /run.sh

ENTRYPOINT ["bash", "/run.sh"]
CMD []
