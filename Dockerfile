#FROM quay.io/ukhomeofficedigital/jenkin-docker-aws
FROM jenkinsci/jenkins:latest

USER root

RUN /usr/local/bin/install-plugins.sh \
  keycloak \
  mask-passwords \
  logstash \
  blueocean

COPY scripts/configure_keycloak.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY scripts/configure_logstash.groovy /usr/share/jenkins/ref/init.groovy.d/
