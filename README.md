# Docker-examples
repository for reference and examples


### Docker compose

Comandos:
```
docker compose --env-file .env.dev up -d --build
docker compose down
```

Para trocar algum parametro do arquivo `.env`
```powershell
$env:ENVIROMENT="production"; docker-compose up -d --build
```

```linux
ENVIROMENT=production docker-compose up -d --build
```

#### Options

| Option | Default | Description |
|--------|---------|-------------|
| --all-resources |  | Include all resources, even those not used by services |
| --ansi | auto | Control when to print ANSI control characters ("never"|"always"|"auto") |
| --compatibility |  | Run compose in backward compatibility mode |
| --dry-run |  | Execute command in dry run mode |
| --env-file | .env | Specify an alternate environment file |
| -f, --file |  | Compose configuration files |
| --parallel | -1 | Control max parallelism, -1 for unlimited |
| --profile  |  | Specify a profile to enable |
| --progress |  | Set type of progress output (auto, tty, plain, json, quiet) |
| --project-directory |  | Specify an alternate working directory (default: the path of the, first specified, Compose file) |
| -p, --project-name |  | Project name |
