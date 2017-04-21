#FROM quay.io/ukhomeofficedigital/jenkin-docker-aws
FROM jenkinsci/jenkins

USER root

COPY configure_keycloak.groovy /usr/share/jenkins/ref/init.groovy.d/
#COPY configure_logstash.groovy /usr/share/jenkins/ref/init.groovy.d/

RUN /usr/local/bin/install-plugins.sh \
  keycloak

# Disable initial wizard
#RUN echo 2.55 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
