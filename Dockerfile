FROM openjdk:17-jdk-slim
WORKDIR /server

# Stiahne Forge 1.20.1
RUN apt-get update && apt-get install -y wget unzip
RUN wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.3.0/forge-1.20.1-47.3.0-installer.jar
RUN java -jar forge-installer.jar --installServer
RUN rm forge-installer.jar

COPY eula.txt /server/eula.txt
COPY mods /server/mods

EXPOSE 25565
ENTRYPOINT ["bash", "run.sh"]

