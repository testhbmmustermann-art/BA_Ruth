Write-Host "=== Stopping and removing existing n8n containers ==="
docker ps -a --filter "name=n8n" --format "{{.ID}}" | ForEach-Object { 
    docker stop $_
    docker rm $_
}
Write-Host "=== Removing old n8n_data volume (for NEW account each run) ==="
docker volume rm n8n_data -f | Out-Null
