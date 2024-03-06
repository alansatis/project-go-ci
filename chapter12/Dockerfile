# 1. Compile the app.
FROM golang:1.18 as builder
WORKDIR /app/chapter12
COPY go.mod /app/chapter12/
COPY go.sum /app/chapter12/
RUN ls -la
RUN go mod download
RUN go mod tidy
RUN ls -la
RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed

# 2. Create final environment for the compiled binary.
FROM alpine:latest
RUN apk --update upgrade && apk --no-cache add curl ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app
RUN mkdir -p /app

# 3. Copy the binary from step 1 and set it as the default command.
COPY --from=builder /app/chapter12/bin/embed /app
CMD /app/embed
