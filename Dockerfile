# Берём официальный образ n8n
FROM n8nio/n8n:latest

# Ставим Python, pip и yt-dlp в изолированное виртуальное окружение
USER root
RUN apk add --no-cache python3 py3-virtualenv \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir yt-dlp

# Добавляем venv в PATH, чтобы yt-dlp был доступен
ENV PATH="/opt/venv/bin:$PATH"

# Возвращаемся к пользователю node
USER node

# Запускаем n8n
CMD ["n8n"]
