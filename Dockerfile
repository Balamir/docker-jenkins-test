#debian linux imajini kullaniyoruz
FROM debian:jessie
#Hazirlayan / Sorumlu
MAINTAINER Abdullah Ceylan "abdullah@ceinteraktif.net"

#Imaja dahil edilecek Jenkins surumu. Her zaman guncel surum : latest
ENV JENKINS_VERSION latest
#JENKINS_HOME degiskenine Jenkins'in verilerinin depolandigi /jenkins dizini ata
ENV JENKINS_HOME /jenkins

#plugins.txt dosyasini /usr/share/jenkins/ icerisine kopyala
COPY plugins.txt /usr/share/jenkins/plugins.txt
#plugins.txt dosyasindaki pluginleri yukle
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

#APT paketlerini guncelle ve java'yi yukle
RUN apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-7-jre-headless && \
    rm -rf /var/lib/apt/lists/*
#Jenkins'in guncel paketini imajda /opt/ dizini icine ekle
ADD http://mirrors.jenkins-ci.org/war/${JENKINS_VERSION}/jenkins.war /opt/jenkins.war
#Jenkins imajinin iznini 644 olarak ayarla
RUN chmod 644 /opt/jenkins.war

#Jenkins'i calistirirken sihirbazi ve sifre alanini esgec
ENTRYPOINT java -Djenkins.install.runSetupWizard=false -jar /opt/jenkins.war 
#ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080 8080
CMD [""]
