FROM ubuntu:xenial

MAINTAINER cybermans <cybermans@gmail.com>
LABEL version 20170822

RUN mkdir -p /opt/couchpotato
RUN mkdir -p /config
RUN mkdir -p /var/log/supervisor

RUN apt-get update && \
    apt-get install -y git python python-pip python-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev supervisor

RUN pip install pyopenssl lxml

RUN git clone https://www.github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 5050/tcp

CMD ["/usr/bin/supervisord"]
#ENTRYPOINT ["/opt/couchpotato/CouchPotato.py --console_log --data_dir=/config"]