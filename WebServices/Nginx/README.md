## NGINX

#### Recarregar a Configuração do Nginx

Após alterar qualquer arquivo de configuração, você precisa recarregar o Nginx para aplicar as mudanças. Isso pode ser feito de forma simples, sem parar o serviço, usando o seguinte comando dentro do container:
```bash
docker exec -it nginx nginx -s reload
```
Ou se você estiver no terminal do container:
```bash
nginx -s reload
```

#### Onde Colocar os Arquivos de Configuração

Dentro do container, o Nginx procura por arquivos de configuração em alguns locais padrão, mas você pode personalizar isso, copiando ou montando volumes.

Aqui estão os locais comuns:

- Arquivo principal: /etc/nginx/nginx.conf
- Arquivos de sites: /etc/nginx/sites-enabled/ e /etc/nginx/sites-available/
- Arquivos adicionais de configuração: /etc/nginx/conf.d/

```bash
/etc/nginx/
  ├── nginx.conf        # Arquivo principal
  ├── conf.d/           # Arquivos de configuração adicionais
  │    ├── default.conf
  │    └── outros.conf
  └── sites-enabled/    # Sites ativados com links simbólicos
       ├── seu_site.conf -> /etc/nginx/sites-available/seu_site.conf
```

#### Criando um link simbólico

Agora, se você quiser ativar a configuração do meu_site.conf, você cria um link simbólico dentro de sites-enabled/ que aponta para o arquivo real em sites-available/.

Você pode fazer isso com o comando `ln -s`, assim:
```bash
ln -s /etc/nginx/sites-available/meu_site.conf /etc/nginx/sites-enabled/
```
