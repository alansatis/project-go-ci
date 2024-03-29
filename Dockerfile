# 1. Stage 1: Build the app.
FROM golang:1.18 as builder
WORKDIR /app/chapter12
COPY . .

# Build the application.
RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed

# 2. Stage 2: Create final environment for the compiled binary.
FROM alpine:latest
RUN apk --update upgrade && apk --no-cache add curl ca-certificates && rm -rf /var/cache/apk/
RUN mkdir -p /app/chapter12

# Copy only the necessary files from the builder stage.
COPY --from=builder /app/chapter12/bin/embed /app/chapter12/
WORKDIR /app/chapter12
CMD ./bin/embed
