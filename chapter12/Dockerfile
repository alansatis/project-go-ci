# Use the official Golang image as a base image
FROM golang:1.18 as builder

# Set the working directory
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download and install the dependencies
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed

# Use a minimal base image to reduce the image size
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app/bin/embed .

# Expose any necessary ports
EXPOSE 8080

# Command to run the application
CMD ["./embed"]
