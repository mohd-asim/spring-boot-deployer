# spring-boot-deployer

## Spring Boot Hello World Application

This is a simple Spring Boot application that returns "Hello, World!" when accessed. The application is containerized using Docker.

## Prerequisites

- JDK 11 or higher
- Maven
- Docker

## Getting Started

### Running the Application Locally

1. **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Build the application:**
    ```bash
    mvn clean install
    ```

3. **Run the application:**
    ```bash
    mvn spring-boot:run
    ```

4. **Access the application:**
    Open your browser and navigate to `http://localhost:8080/hello`.

### Running the Application in a Docker Container

1. **Build the Docker image:**
    ```bash
    docker build -t spring-boot-demo .
    ```

2. **Run the Docker container:**
    ```bash
    docker run -p 8080:8080 spring-boot-demo
    ```

3. **Access the application:**
    Open your browser and navigate to `http://localhost:8080/hello`.

## Flow Diagram

```plaintext
+-------------+       +-------------+
|             |       |             |
|   Browser   | <---> | Spring Boot |
|             |       | Application |
+-------------+       +-------------+
        |                     |
        v                     v
+-------------+       +-------------+
|             |       |             |
|   Docker    | <---> |   Docker    |
|   Client    |       |   Daemon    |
+-------------+       +-------------+
```

## Files Overview

- `pom.xml`: Maven configuration file with dependencies.
- `src/main/java/com/example/demo/DemoApplication.java`: Main Spring Boot application class.
- `src/main/java/com/example/demo/HelloController.java`: Controller that returns "Hello, World!".
- `Dockerfile`: Docker configuration file to build and run the application.

## License

This project is licensed under the MIT License.