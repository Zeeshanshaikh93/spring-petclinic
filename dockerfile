FROM openjdk:21 AS builder
ADD . /spring-petclinic
WORKDIR /spring-petclinic
RUN chmod +x mvnw
RUN ./mvnw package


FROM openjdk:17-jdk-alpine3.20 AS runner
EXPOSE 8080
WORKDIR /spc
COPY --from=builder /spring-petclinic/target/*.jar spc.jar
CMD ["java", "-jar", "spring-petclinic.jar"]