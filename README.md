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
