### Stage 1: Build the app ###
FROM openjdk:21 AS builder
ADD . /spring-petclinic
WORKDIR /spring-petclinic
RUN chmod +x mvnw
RUN ./mvnw package -DskipTests

### Stage 2: Run the app ###
FROM openjdk:17-jdk-alpine AS runner
WORKDIR /spc
EXPOSE 8080
COPY --from=builder /spring-petclinic/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
