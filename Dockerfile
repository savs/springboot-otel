# Use an official Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Use a smaller JRE image for running the app
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/hello-springboot-0.0.1-SNAPSHOT.jar app.jar
COPY grafana-opentelemetry-java.jar grafana-opentelemetry-java.jar
EXPOSE 8080

ENV OTEL_TRACES_EXPORTER=otlp
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_INSECURE=true
ENV OTEL_RESOURCE_ATTRIBUTES="deployment.environment=development,service.namespace=demo,service.instance.id=98606,demo=andrew"
ENV OTEL_SERVICE_NAME="springboot-sample-app"
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://springboot-alloy:4317
ENV OTEL_EXPORTER_OTLP_PROTOCOL=grpc

ENTRYPOINT ["java", "-javaagent:/app/grafana-opentelemetry-java.jar", "-jar", "app.jar"]
