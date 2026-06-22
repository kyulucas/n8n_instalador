#!/usr/bin/env bash
# Prepara Debian com Docker Engine + Compose
# Uso (como root): bash scripts/setup-debian.sh

set -euo pipefail

echo "==> Atualizando pacotes..."
apt update -qq
apt upgrade -y -qq

echo "==> Instalando dependências..."
apt install -y -qq ca-certificates curl gnupg

if ! command -v docker &>/dev/null; then
  echo "==> Instalando Docker..."
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
  chmod a+r /etc/apt/keyrings/docker.asc
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "${VERSION_CODENAME}") stable" \
    > /etc/apt/sources.list.d/docker.list
  apt update -qq
  apt install -y -qq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

echo "==> Habilitando Docker no boot..."
systemctl enable docker
systemctl start docker

echo ""
echo "Pronto! Próximos passos:"
echo "  1. cp .env.example .env && nano .env"
echo "  2. docker compose up -d"
echo "  3. Acesse http://<IP>:5678"
