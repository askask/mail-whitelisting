FROM maven:3.8-openjdk-17 AS build

ADD src src/
ADD pom.xml pom.xml
RUN mvn install


FROM scratch

COPY --from=build target/mail-whitelisting-*.jar mail-whitelisting.jar
