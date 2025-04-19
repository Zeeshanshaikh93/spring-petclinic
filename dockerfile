FROM maven:3.9-eclipse-temurin-17 AS builder
COPY . /spc
WORKDIR /spc
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jre AS runner
WORKDIR /app
COPY --from=builder /spc/target/spring-petclinic-3.4.0-SNAPSHOT.jar spring-petclinic.jar
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic.jar"]
