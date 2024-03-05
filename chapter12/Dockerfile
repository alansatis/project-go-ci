# Use the official Golang image as a base image
FROM golang:1.18 as builder

# Set the working directory
WORKDIR /app

# Copy the Go module files
COPY chapter12/go.mod chapter12/go.sum ./


# Download and install the dependencies
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed

# 2. Create final environment for the compiled binary.
FROM alpine:latest
RUN apk --update upgrade && apk --no-cache add curl ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir -p /app
# 3. Copy the binary from step 1 and set it as the default command.
COPY --from=builder /app/bin/embed /app
WORKDIR /app
CMD /app/embed
