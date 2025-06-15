# Hello Spring Boot Application

This is a simple "Hello, World!" application built with Spring Boot.

## How to Run

1. Make sure you have Java 17+ and Gradle installed (or use the included Gradle wrapper).
2. Run the application with:

```bash
./gradlew bootRun
```

3. Open your browser and go to [http://localhost:8080](http://localhost:8080) to see the "Hello, World!" message.

## How to run in Docker with OTEL auto instrumentation

1. Configure the following environment variables in the .env file:  

```bash
GC_OTEL_USERNAME=your_gc_otel_username
GC_OTEL_TOKEN=your_gc_otel_token
GC_METRIC_ENDPOINT=your_gc_metric_endpoint
GC_METRIC_USERNAME=your_gc_metric_username
GC_METRIC_TOKEN=your_gc_metric_token
GC_LOG_ENDPOINT=your_gc_log_endpoint
GC_LOG_USERNAME=your_gc_log_username
GC_LOG_TOKEN=your_gc_log_token
GC_TRACE_ENDPOINT=your_gc_trace_endpoint
GC_TRACE_USERNAME=your_gc_trace_username
GC_TRACE_TOKEN=your_gc_trace_token
```

2. Run the included ./run.sh script or:

```bash
docker compose down --remove-orphans; clear; docker compose up -d --build
```

3. Open your browser and go to [http://localhost:8080](http://localhost:8080) to see the "Hello, World!" message.

4. Create load by running the included ./load.sh script:

```bash
./load.sh
```
