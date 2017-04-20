FROM quay.io/ukhomeofficedigital/jenkin-docker-aws

COPY configure_keycloak.groovy /usr/share/jenkins/configure_keycloak.groovy
COPY jenkins-cli.jar /usr/share/jenkins/jenkins-cli.jar
COPY configure_keycloak.groovy /usr/share/jenkins/ref/init.groovy.d/

RUN java -jar /usr/share/jenkins/jenkins-cli.jar -s http://localhost:8080 groovy /usr/share/jenkins/permission.groovy --username admin --password password

# Disable initial wizard
RUN echo 2.19.1 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
    echo 2.19.1 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
