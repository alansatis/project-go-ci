# Use the official Golang image as a base image
# 1. Compile the app.
FROM golang:1.18  as builder
WORKDIR /app
COPY . .
#Debug
RUN pwd
RUN ls -al

RUN go mod init github.com/alansatis/project-go-ci/chapter12

#debug 02
RUN cat go.mod
RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed

# 2. Create final environment for the compiled binary.
FROM alpine:latest
RUN apk --update upgrade && apk --no-cache add curl ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir -p /app
WORKDIR /app

# 3. Copy the binary from step 1 and set it as the default command.
COPY --from=builder /app/bin/embed /app
WORKDIR /app
CMD /app/embed
