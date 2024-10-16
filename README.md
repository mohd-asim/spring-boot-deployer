# spring-boot-deployer

## Multi-Stage Dockerfile

This project uses a multi-stage Dockerfile to optimize the build process and reduce the final image size. Multi-stage builds allow you to use multiple `FROM` statements in your Dockerfile, each representing a different stage of the build. This approach helps in separating the build environment from the runtime environment, ensuring that only the necessary artifacts are included in the final image.

### Benefits
- **Smaller Image Size**: Only the necessary files and dependencies are included in the final image.
- **Improved Security**: Reduces the attack surface by excluding build tools and other unnecessary components.
- **Faster Builds**: By caching intermediate stages, subsequent builds can be faster.

### Example
Here is an example of a multi-stage Dockerfile:

```Dockerfile
# Stage 1: Build
FROM golang:1.16 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp

# Stage 2: Run
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/myapp .
CMD ["./myapp"]
```

In this example, the first stage (`builder`) compiles the Go application, and the second stage (`alpine`) creates a minimal runtime environment to run the compiled application.

### Usage
To build and run the Docker image, use the following commands:

```sh
docker build -t myapp .
docker run myapp
```

This will create and run a Docker container using the optimized multi-stage build process.

# Spring Boot Hello World Application

This is a simple Spring Boot application that returns "Hello, World!" at the `/hello` endpoint.

## Requirements

- Java 11 or higher
- Docker (optional, for containerization)

## Running the Application

### Locally

1. Clone the repository:

    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. Build the application using Maven:

    ```bash
    ./mvnw clean install
    ```

3. Run the application:

    ```bash
    ./mvnw spring-boot:run
    ```

4. Access the application at `http://localhost:8080/hello`.

### Using Docker

1. Build the Docker image:

    ```bash
    docker build -t spring-boot-demo .
    ```

2. Run the Docker container:

    ```bash
    docker run -p 8080:8080 spring-boot-demo
    ```

3. Access the application at `http://localhost:8080/hello`.

## Multi-Stage Dockerfile

This repository includes a multi-stage Dockerfile to optimize the image size and build process. The multi-stage build allows you to separate the build environment from the runtime environment, resulting in a smaller final image.

### Building the Multi-Stage Docker Image

1. Build the Docker image:

    ```bash
    docker build -t spring-boot-demo:multistage -f Dockerfile.multistage .
    ```

2. Run the Docker container:

    ```bash
    docker run -p 8080:8080 spring-boot-demo:multistage
    ```

3. Access the application at `http://localhost:8080/hello`.

## Flow Diagram

```plaintext
+-------------+      +-----------+      +----------------------+
|             |      |           |      |                      |
|   Browser   +----->+   Server  +----->+  HelloController     |
|             |      |           |      |                      |
+-------------+      +-----------+      +----------------------+
```

## Project Structure

```plaintext
spring-boot-demo
├── Dockerfile
├── Dockerfile.multistage
├── README.md
├── mvnw
├── mvnw.cmd
├── pom.xml
└── src
    ├── main
    │   ├── java
    │   │   └── com
    │   │       └── example
    │   │           └── demo
    │   │               ├── DemoApplication.java
    │   │               └── HelloController.java
    │   └── resources
    │       └── application.properties
    └── test
        └── java
            └── com
                └── example
                    └── demo
                        └── DemoApplicationTests.java
```

## Additional Information

- This application uses Spring Boot 2.5.4.
- The Docker image is based on the official OpenJDK 11 image.