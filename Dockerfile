FROM debian:jessie
MAINTAINER Abdullah Ceylan "abdullah@ceinteraktif.net"

RUN apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-7-jre-headless && \
    rm -rf /var/lib/apt/lists/*
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war

ENV JENKINS_HOME /jenkins

ADD jenkins-data/workspace/cli_test ${JENKINS_HOME}/

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080 8080
CMD [""]
