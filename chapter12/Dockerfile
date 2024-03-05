# 1. Compile the app.
FROM golang:1.18 as builder
COPY go.mod go.sum ./
RUN go mod tidy
COPY . .
WORKDIR /app/chapter12  # Defina o diretório de trabalho para onde estão os arquivos Go
RUN go mod tidy
RUN ls -la
RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed

# 2. Create final environment for the compiled binary.
FROM alpine:latest
RUN apk --update upgrade && apk --no-cache add curl ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir -p /app

# 3. Copy the binary from step 1 and set it as the default command.
COPY --from=builder /app/chapter12/bin/embed /app
WORKDIR /app
CMD /app/embed
