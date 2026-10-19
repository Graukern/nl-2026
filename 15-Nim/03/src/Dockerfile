FROM nimlang/nim:latest

WORKDIR /app
COPY . .

# Флаг --threads:on обязателен для работы std/threadpool
RUN nim c --threads:on -d:release main.nim

CMD ["./main"]