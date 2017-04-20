#FROM quay.io/ukhomeofficedigital/jenkin-docker-aws
FROM jenkins

COPY configure_keycloak.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY configure_logstash.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Disable initial wizard
#RUN echo 2.19.1 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
#    echo 2.19.1 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
