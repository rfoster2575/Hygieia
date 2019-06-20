
FROM docker.io/openjdk:8-jre

MAINTAINER Hygieia@capitalone.com

RUN mkdir /hygieia /hygieia/config
RUN touch /hygieia/config/application.properties
RUN chmod 777 /hygieia/config/application.properties

COPY *.jar /hygieia/
COPY properties-builder.sh /hygieia/

#COPY certificates/ /hygieia/

WORKDIR /hygieia

#RUN keytool -import -trustcacerts -noprompt -alias cpi.cmscloud.local-CA -file cpi.cmscloud.local-CA.der -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit 
#RUN keytool -import -trustcacerts -noprompt -alias cpi.cmscloud.local -file cpi.cmscloud.local-CA.pem -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit 

VOLUME ["/hygieia/logs"]

ENV PROP_FILE /hygieia/config/application.properties

CMD ./properties-builder.sh && \
  java -jar jenkins-build-collector*.jar --spring.config.location=$PROP_FILE

