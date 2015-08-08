FROM dockerfile/java:openjdk-7-jdk
MAINTAINER JengHung Chen <jenghung.chen@gmail.com>

RUN apt-get update && apt-get install -y maven

RUN curl -sL https://deb.nodesource.com/setup | sudo bash - && apt-get install -y nodejs

RUN npm install -g yo bower generator-jhipster@2.19.0 grunt-cli gulp

RUN adduser --disabled-password --gecos "" jhipster

RUN mkdir /home/jhipster/project/

EXPOSE 8080

ENV HOME /home/jhipster

WORKDIR /home/jhipster

USER jhipster

VOLUME ["/home/jhipster/project"]
