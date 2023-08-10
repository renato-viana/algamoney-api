# Use a imagem base do Eclipse Temurin com JDK 17 para compilação
FROM maven:3.8.1-openjdk-17 AS build

# Diretório de trabalho no contêiner para a fase de compilação
WORKDIR /app

# Copie todos os arquivos do diretório atual para o diretório de trabalho no contêiner
COPY . .

# Execute o comando 'mvn package' para compilar e empacotar o projeto
RUN mvn clean package -Pprod -DskipTests

# Segunda fase para a imagem final
FROM openjdk:17-jdk-slim

# Diretório de trabalho no contêiner para a fase final
WORKDIR /app

# Copie o arquivo JAR gerado da fase de compilação para o contêiner com um novo nome
COPY --from=build /app/target/algamoney-api-1.0.0-SNAPSHOT.jar app.jar

# Defina o comando de entrada para executar o JAR
ENTRYPOINT ["java","-jar","app.jar"]

# Exponha a porta 8080
EXPOSE 8080

