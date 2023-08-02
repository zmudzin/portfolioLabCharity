# Pobieranie oficjalnego obrazu Javy 16
FROM openjdk:17-alpine

# Ustawienie katalogu roboczego w kontenerze
WORKDIR /app

# Kopiowanie plików aplikacji do katalogu roboczego
COPY . /app

# Instalacja Maven (jeśli nie jest zainstalowany w obrazie adoptopenjdk)
RUN apk update && apk add maven

# Budowanie aplikacji
RUN mvn package

# Port, na którym działa aplikacja
EXPOSE 8080

# Uruchomienie aplikacji po starcie kontenera
CMD ["java", "-jar", "target/charity-0.0.1-SNAPSHOT.jar"]