FROM openjdk:8-jdk-alpine
WORKDIR workspace
RUN wget https://github.com/herminiogg/ShExML/releases/download/v0.2.5/ShExML-v0.2.5.jar
RUN mv ShExML-v0.2.5.jar ../ShExML.jar
ENTRYPOINT ["java", "-jar", "../ShExML.jar"]