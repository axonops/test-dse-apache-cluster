FROM adoptopenjdk:8-jre-hotspot-bionic as cassandra-base

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install wget sysstat locales -y --no-install-recommends && \
	apt-get autoclean && apt-get --purge -y autoremove && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	echo "en_IE.UTF-8 UTF-8" >> /etc/locale.gen && \
	# set the locale of the container:
    locale-gen

ENV LC_ALL=en_IE.UTF-8
ENV LANG=en_IE.UTF-8
ENV LANGUAGE=en_IE.UTF-8

# Install missing packages
RUN set -x \
    && apt-get update -qq \
    && apt-get install -y python python-dev libkrb5-dev adduser lsb-base procps gzip zlib1g wget debianutils libaio1 sudo python-pip webhook\
    && pip install pure-sasl \
    && pip install kerberos \
    && apt-get remove -y python3 \
    && apt-get autoremove --yes \
    && apt-get clean all \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/


ENV CASSANDRA_HOME /opt/cassandra

RUN set -x \
    && groupadd -r cassandra --gid=999 \
    && useradd -m -d "$CASSANDRA_HOME" -r -g cassandra --uid=999 cassandra


FROM cassandra-base as cassandra-server-base

#https://downloads.apache.org/cassandra/4.0.11/apache-cassandra-4.0.11-bin.tar.gz
ARG VERSION=4.0.11
ARG TARBALL=apache-cassandra-4.0.11-bin.tar.gz

ADD files /

COPY /* /

ENV CASSANDRA_HOME /opt/cassandra
ENV TARBALL apache-cassandra-4.0.11-bin.tar.gz

RUN set -x \
    && tar -C "$CASSANDRA_HOME" --strip-components=1 -xzf /${TARBALL} \
    && rm /${TARBALL} \
    && chown -R cassandra:cassandra ${CASSANDRA_HOME}


FROM cassandra-server-base

COPY --chown=cassandra:cassandra --from=cassandra-server-base $CASSANDRA_HOME $CASSANDRA_HOME

ENV CASSANDRA_HOME /opt/cassandra
ENV PATH $CASSANDRA_HOME/bin:$PATH
ENV HOME $CASSANDRA_HOME
WORKDIR $HOME

USER root