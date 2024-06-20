# Etapa 1: Construir o binário
FROM golang:alpine3.14 AS builder

# Criar diretório de trabalho
WORKDIR /app

# Copiar o código fonte
COPY . .

# Compilar o binário estático
RUN go build -o /main main.go

# Etapa 2: Criar imagem final
FROM scratch

# Criar diretório de trabalho
WORKDIR /

# Copiar o binário da etapa de construção
COPY --from=builder /main /main

# Expor a porta 8080
EXPOSE 8080

# Definir ponto de entrada
ENTRYPOINT ["/main"]