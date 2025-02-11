FROM ubuntu:24.04

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y tzdata traceroute tcpdump telnet iputils-ping dnsutils mtr nmap procps iproute2 wget curl locales logrotate rsyslog gnupg ca-certificates ncdu && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive tzdata && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
