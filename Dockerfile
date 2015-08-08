FROM ubuntu:14.04
MAINTAINER JengHung Chen <jenghung.chen@gmail.com>

RUN apt-get install -y --force-yes software-properties-common

RUN add-apt-repository -y ppa:webupd8team/java && apt-get update

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get install -y --force-yes oracle-java7-installer maven curl

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash - && apt-get install --yes nodejs

RUN npm install -g yo bower generator-jhipster@2.19.0 grunt-cli gulp

RUN adduser --disabled-password --gecos "" jhipster

EXPOSE 8080

ENV HOME /home/jhipster

WORKDIR /home/jhipster

USER jhipster

VOLUME ["/home/jhipster"]
