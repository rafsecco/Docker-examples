### Comandos Docker
cd .\WordPress\bedrock\
docker compose -p wp-bedrock build --force-rm
docker compose -p wp-bedrock --env-file .env.dev up -d
docker compose -p wp-bedrock down

docker restart [nome/id do container]
docker exec [nome/id do container] service [nome_do_servico] restart
docker exec wp-bedrock-nginx service nginx restart

### Acessos
http://localhost:8080
http://localhost:8080/wp/wp-admin
http://localhost:8080/wp/wp-login.php

Nome: Teste wp bedrock
User: testewp
Pass: testewp_123
Email: raf.secco@gmail.com

2. Ajustar permissões nos volumes
Se mesmo com FS_METHOD=direct ainda pedir FRP, você pode também garantir que o processo www-data tem acesso de escrita:
docker compose exec php chown -R www-data:www-data /var/www/html
E se estiver no Mac/Windows, às vezes é necessário mapear o volume como read/write no docker-compose.yml

volumes:
  - ./wp-bedrock:/var/www/html:cached

Ou mesmo garantir permissões localmente no host:
chmod -R 775 wp-bedrock/web/app

### Comandos utilizados
cd .\WordPress\bedrock\
Instalar Bedrock
  composer create-project roots/bedrock wp-bedrock
  cp wp-bedrock/.env.example wp-bedrock/.env

Para adicionar plugins como dependências
Acesse o diretorio do site (wp-bedrock) e execute o comando:
  composer require wpackagist-plugin/[Nome-Plugin]


Exemplo para adicionar o `better-search-replace`
  cd .\wp-bedrock\
  composer require wpackagist-plugin/better-search-replace

### Composer - Gerenciar dependências

Comando para adicionar um plugin `composer require <namespace>/<packagename>`
```
composer create-project roots/bedrock [NomeProjeto]
composer require wpackagist-plugin/elementor
composer require wpackagist-plugin/smart-slider-3
```


### Links Uteis

https://roots.io/bedrock/
https://github.com/roots/bedrock

https://wordpress.org/plugins/
https://github.com/rodrigo-gpereira/docker-lemp-stack

https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
https://www.hostinger.com/br/tutoriais/wordpress-docker
https://www.docker.com/blog/how-to-dockerize-wordpress/

https://github.com/frocentric/wordpress   https://www.youtube.com/watch?v=VnTiwu7LUZ0

https://www.youtube.com/watch?v=VnTiwu7LUZ0
