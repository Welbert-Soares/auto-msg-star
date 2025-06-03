# OPÇÃO 1: Dockerfile (Recomendado)
# Crie este arquivo na raiz do projeto: Dockerfile

FROM n8nio/n8n:latest

# Configurações de ambiente
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=America/Sao_Paulo
ENV TZ=America/Sao_Paulo

# Configurações de produção
ENV NODE_ENV=production
ENV N8N_METRICS=true
ENV N8N_LOG_LEVEL=info

# Expor a porta
EXPOSE 5678

# Comando de inicialização
CMD ["n8n", "start"]