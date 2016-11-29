# docker-jenkins

8080 portunu dinleyen jenkins kurulu bir container ayarlar.

## Kullanim

Container'i calistirmak icin:

    docker run -d -P Balamir/jenkins
    
    docker ps
    CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                     NAMES
    1131d37c35b2        Balamir/jenkins:latest    java -jar /opt/jenki   9 seconds ago      Up 9 seconds       0.0.0.0:8080->8080/tcp   high_waters

Artik jenkins yansimasi http://localhost:8080 adresine gittiginde calisiyor olacak.

### Kalici Yapilandirma

Varsayilan olarak JENKINS_HOME env'i /jenkins olarak tanimli. Data Volume icin dokuman:

  * https://docs.docker.com/userguide/dockervolumes/
  
## Yapi Olusturma

Kalip (imaj) olusturmak icin:

    docker build github.com/Balamir/docker-jenkins-test

Onceden olusturulmus container, ayni zamanda docker'da da mevcut

    docker pull abdullahceylan/docker-jenkins-test


## Hazirlayan

  * Abdullah Ceylan (<abdullah@ceinteraktif.net>)
