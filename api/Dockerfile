FROM maven:3.6.0-jdk-8-alpine as BUILD
COPY . .
RUN mvn package -Dpmd.skip=true

FROM openjdk:8-jre

RUN mkdir -p /hygieia/config
RUN touch /hygieia/config/application.properties
RUN chmod 777 /hygieia/config/application.properties

VOLUME ["/hygieia/logs"]

EXPOSE 8080

ENV PROP_FILE /hygieia/config/application.properties

WORKDIR /hygieia

COPY --from=BUILD target/*.jar /hygieia
COPY docker/properties-builder.sh /hygieia/

CMD ./properties-builder.sh && \
  java -Djava.security.egd=file:/dev/./urandom -jar *.jar --spring.config.location=$PROP_FILE