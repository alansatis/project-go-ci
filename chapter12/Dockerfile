# Use a imagem base do Golang 1.18
FROM docker.io/library/golang:1.18@sha256:50c889275d26f816b5314fc99f55425fa76b18fcaf16af255f5d57f09e1f48da

# Atualize os pacotes e instale as dependências necessárias
RUN apk --update upgrade && apk --no-cache add curl ca-certificates && rm -rf /var/cache/apk/*

# Crie o diretório de trabalho /app
RUN mkdir -p /app

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos go.mod e go.sum para o diretório /app
COPY go.mod go.sum ./

# Baixe as dependências do módulo Go
RUN go mod download

# Copie todo o conteúdo do diretório chapter12 para /app/chapter12
COPY chapter12/ /app/chapter12/

# Exiba informações sobre o diretório atual
RUN ls -al

# Inicialize o módulo Go
RUN go mod init github.com/alansatis/project-go-ci/chapter12

# Exiba informações sobre o diretório atual e o diretório chapter12
RUN ls -al
RUN ls -al chapter12

# Compile o código Go
RUN CGO_ENABLED=0 GOOS=linux go build -a -o bin/embed
