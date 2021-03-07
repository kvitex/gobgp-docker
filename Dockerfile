FROM alpine:3.12.4

EXPOSE 179

RUN mkdir /go

WORKDIR /bin

RUN apk add --no-cache wget

RUN wget https://github.com/osrg/gobgp/releases/download/v2.25.0/gobgp_2.25.0_linux_amd64.tar.gz && tar xvfz gobgp_2.25.0_linux_amd64.tar.gz


# This directory must be mounted as a local volume with '-v `pwd`/gobgp:/etc/gobgp:rw' docker's command line option.
# The host's file at `pwd`/gobgp/gobgp.conf is used as the configuration file for GoBGP.
RUN mkdir /etc/gobgp

CMD gobgpd -f /etc/gobgp/gobgp.conf -p > /etc/gobgp/log