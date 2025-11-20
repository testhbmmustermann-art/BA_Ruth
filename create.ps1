Write-Host "=== Creating fresh n8n_data volume ==="
docker volume create n8n_data | Out-Null

Write-Host "=== Starting new n8n container with user signup and admin setup ==="
docker run -it --rm `
  --name n8n `
  -p 5678:5678 `
  -v n8n_data:/home/node/.n8n `
  -e N8N_ENABLE_SIGNUP="true" `
  -e N8N_USER_MANAGEMENT_JWT_SECRET="secret" `
  -e N8N_ADMIN_USER="admin" `
  -e N8N_ADMIN_PASSWORD="adminpassword" `
  -e N8N_SMTP_HOST="smtp.your-email-provider.com" `
  -e N8N_SMTP_PORT="587" `
  -e N8N_SMTP_USER="your-email@example.com" `
  -e N8N_SMTP_PASS="your-email-password" `
  -e N8N_SMTP_SENDER="your-email@example.com" `
  docker.n8n.io/n8nio/n8n
