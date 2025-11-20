Write-Host "=== Stopping existing n8n containers ==="
docker ps -a --filter "name=n8n" --format "{{.ID}}" | ForEach-Object { docker stop $_; docker rm $_ }

Write-Host "=== Ensuring n8n_data volume exists ==="
docker volume create n8n_data | Out-Null

Write-Host "=== Starting new n8n container ==="
docker run -it --rm `
  --name n8n `
  -p 5678:5678 `
  -v n8n_data:/home/node/.n8n `
  docker.n8n.io/n8nio/n8n
