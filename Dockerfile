FROM ubuntu:xenial
MAINTAINER Lewis Lambert <lewis.lambert@zserve.co.uk>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get upgrade -q -y \
	&& apt-get install -q -y wget vim python sqlite3 libsqlite3-dev python-dev python-pip git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& cd /tmp \
	&& wget http://www.multichain.com/download/multichain-1.0-beta-1.tar.gz \
	&& tar -xvzf multichain-1.0-beta-1.tar.gz \
	&& cd multichain-1.0-beta-1 \
	&& mv multichaind multichain-cli multichain-util /usr/local/bin \
	&& cd /tmp \
	&& rm -Rf multichain*

VOLUME [ "/opt/chains" ]

EXPOSE 8333 8332 18333 18332
