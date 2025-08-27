# Базовый официальный образ n8n
FROM n8nio/n8n:latest

# Ставим Python + pip + yt-dlp в Alpine
USER root
RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir yt-dlp

# Возвращаемся обратно на пользователя node
USER node

# Запускаем n8n
CMD ["n8n"]
