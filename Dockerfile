FROM n8nio/n8n:latest

# Configurar usuário root temporariamente
USER root

# Instalar wget para healthcheck
RUN apk add --no-cache wget

# Voltar para o usuário node
USER node

# Expor a porta
EXPOSE 5678

# Variáveis de ambiente
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=America/Sao_Paulo
ENV TZ=America/Sao_Paulo
ENV N8N_METRICS=true
ENV N8N_LOG_LEVEL=info
ENV NODE_ENV=production
ENV N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=5 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:5678/ || exit 1

# Comando padrão usando o caminho completo do node
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]