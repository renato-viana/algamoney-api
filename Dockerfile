# Use a imagem base do Eclipse Temurin com JDK 17
FROM maven:3.8.1-openjdk-17 AS build

# Diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo pom.xml para o contêiner
COPY pom.xml .
COPY src .

# Execute o comando 'mvn package' para compilar e empacotar o projeto
RUN mvn package -DskipTests

# Copie o arquivo JAR gerado para o contêiner com um novo nome
COPY ./target/algamoney-api-1.0.0-SNAPSHOT.jar app.jar

# Defina o comando de entrada para executar o JAR
ENTRYPOINT ["java","-jar","app.jar"]

# Exponha a porta 8080
EXPOSE 8080
