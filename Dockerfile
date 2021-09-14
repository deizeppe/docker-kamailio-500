FROM debian:10-slim

LABEL mantainer Ricardo Deizeppe <ricardo.deizeppe@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV KAMAILIO_CFG_PATH /etc/kamailio/kamailio.cfg

# -------------------- APT installs
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    git     \
    curl    \
    wget    \
    gnupg   \
    dirmngr \
    runit   \
    procps  \
    rsyslog  \
    parallel        \
    ca-certificates \
    && rm -rf /var/lib/apt/lists

RUN apt-get update &&           \
    apt-get install -yqq        \
    net-tools                   \
    kamailio                    \
    kamailio-autheph-modules    \
    kamailio-berkeley-bin       \
    kamailio-berkeley-modules   \
    kamailio-json-modules       \
    kamailio-mysql-modules      \
    kamailio-outbound-modules   \
    kamailio-perl-modules       \
    kamailio-postgres-modules   \
    kamailio-presence-modules   \
    kamailio-python-modules     \
    kamailio-python3-modules    \
    kamailio-ruby-modules       \
    kamailio-systemd-modules    \
    kamailio-tls-modules        \
    kamailio-utils-modules      \
    kamailio-websocket-modules  \
    && rm -rf /var/lib/apt/lists


# -------------------- Kamailio configs
RUN echo "local0.*                        -/var/log/kamailio.log" >> /etc/rsyslog.conf
RUN touch /var/log/kamailio.log


ADD units /
ADD kamailio.cfg /

RUN ln -s /etc/sv/* /etc/service

COPY kamailio.cfg /etc/kamailio/kamailio.cfg
COPY entrypoint.sh /entrypoint.sh

EXPOSE 5060/udp

ENTRYPOINT ["/entrypoint.sh"]

