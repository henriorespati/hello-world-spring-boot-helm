FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5

MAINTAINER Muhammad Edwin < edwin at redhat dot com >

LABEL BASE_IMAGE="registry.access.redhat.com/ubi8/ubi-minimal:8.5", JAVA_VERSION="11", WORK_DIRECTORY="/work/"

RUN microdnf install --nodocs java-11-openjdk-headless && microdnf clean all

WORKDIR /work/
COPY *.jar /work/application.jar

EXPOSE 8080
CMD ["java", "-jar", "application.jar"]