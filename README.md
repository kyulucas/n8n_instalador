# n8n + Docker

## 1. Baixar o projeto

```bash
cd /opt
git clone https://github.com/kyulucas/n8n_instalador.git n8n
cd n8n
```

## 2. Instalar Docker (Debian)

```bash
bash scripts/setup-debian.sh
```

## 3. Subir o n8n

```bash
cp .env.example .env
nano .env
docker compose up -d
```

No `.env`, defina senhas e o IP do servidor (`N8N_HOST`, `N8N_EDITOR_BASE_URL`, `WEBHOOK_URL`).

Gere a chave de criptografia:

```bash
openssl rand -hex 32
```

## 4. Acessar

- Editor: `http://<IP>:5678`
- Webhooks: `http://<IP>:5679`

Na primeira visita, crie o usuário administrador.

## Comandos úteis

```bash
docker compose ps
docker compose logs -f n8n_editor
docker compose down
```
