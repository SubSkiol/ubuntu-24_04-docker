# Docker Notes
### compose
#### compose.yaml
build - Build the dockerfile
image - Names the resulting image
container_name - gives the container the name
network_mode - different network modes can be used, host shares the host's namespace which can be useful.
volumes - mounts the workspace into the container

#### commands
docker compose up -d --build
docker compose ps
docker compose exec ros zsh
docker compose down
docker compose up -d
