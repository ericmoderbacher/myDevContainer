FROM ubuntu:latest
LABEL authors="ericmoderbacher"

ENTRYPOINT ["top", "-b"]