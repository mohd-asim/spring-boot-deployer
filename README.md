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

## License

This project is licensed under the MIT License.