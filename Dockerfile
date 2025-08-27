# Берём официальный образ n8n
FROM n8nio/n8n:latest

# Ставим Python, pip и yt-dlp глобально для пользователя node
USER root
RUN apk add --no-cache python3 py3-pip \
    && pip3 install --no-cache-dir yt-dlp

# Возвращаемся к пользователю node
USER node

# Запускаем n8n
CMD ["n8n"]
