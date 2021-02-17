FROM ubuntu
WORKDIR workspace
RUN apt-get update && apt-get install -y openjdk-8-jdk git
RUN apt-get install -y apt-transport-https ca-certificates
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update 
RUN apt-get install -y sbt
RUN git clone https://github.com/herminiogg/ShExML.git
WORKDIR ShExML
RUN git checkout develop && git pull origin develop
RUN sbt 'set test in assembly := {}' clean assembly
WORKDIR /workspace
RUN cp ShExML/target/scala-2.12/ShExML-assembly-*.jar ../ShExML.jar
ENTRYPOINT ["java", "-jar", "../ShExML.jar"]