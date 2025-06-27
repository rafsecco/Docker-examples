# WordPress with Docker Compose

[Tutorial da DigitalOcean]([https://](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose))

A registered domain name. This tutorial will use your_domain throughout or change hosts file.
- An A record with your_domain pointing to your server’s public IP address.
- An A record with www.your_domain pointing to your server’s public IP address.


### Docker compose

Comandos:
```
docker compose -p wp-dockercompose up -d --build
docker compose -p wp-dockercompose down
```

You can now check that your certificates have been mounted to the webserver container with docker-compose exec:
```
docker-compose exec webserver ls -la /etc/letsencrypt/live
```


#### Options

| Option              | Default | Description                                                                                      |
| ------------------- | ------- | ------------------------------------------------------------------------------------------------ |
| --all-resources     |         | Include all resources, even those not used by services                                           |
| --ansi              | auto    | Control when to print ANSI control characters ("never"                                           | "always" | "auto") |
| --compatibility     |         | Run compose in backward compatibility mode                                                       |
| --dry-run           |         | Execute command in dry run mode                                                                  |
| --env-file          | .env    | Specify an alternate environment file                                                            |
| -f, --file          |         | Compose configuration files                                                                      |
| --parallel          | -1      | Control max parallelism, -1 for unlimited                                                        |
| --profile           |         | Specify a profile to enable                                                                      |
| --progress          |         | Set type of progress output (auto, tty, plain, json, quiet)                                      |
| --project-directory |         | Specify an alternate working directory (default: the path of the, first specified, Compose file) |
| -p, --project-name  |         | Project name                                                                                     |
