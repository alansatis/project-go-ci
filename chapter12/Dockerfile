# 1. Compile the app.
FROM golang:1.18 as builder
WORKDIR /app/chapter12

# Copy only the go.mod and go.sum files to download dependencies.
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code.
COPY . .

# Check the copied files and directories.
RUN ls -la

# Run go mod tidy to ensure dependencies are consistent.
RUN go mod tidy

# Build the application.
RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed

# 2. Create final environment for the compiled binary.
FROM alpine:latest
RUN apk --update upgrade && apk --no-cache add curl ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir -p /app/chapter12

# 3. Copy the binary from step 1 and set it as the default command.
COPY --from=builder /app/chapter12/bin/embed /app/chapter12

WORKDIR /app/chapter12
CMD ./bin/embed
