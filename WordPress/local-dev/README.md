## WordPress Local for development

Para testar este exemplo precisa ser alterado o arquivo hosts, no caso como instalamos o docker desktop apenas verifique se tem registrado o `host.docker.internal`

- Windows: C:\Windows\System32\Drivers\etc\hosts
- Linux: /etc/hosts
- MacOS: /etc/hosts

Acrescente a linha abaixo no arquivo hosts
```

```


## Criando o certificado SSL local

#### Usando OpenSSL

Passo 1: Instalar OpenSSL (se necessário)
  https://slproweb.com/products/Win32OpenSSL.html

Passo 2: Gerar a chave privada
```
openssl genpkey -algorithm RSA -out myserver.key -aes256
```
Aqui, `myserver.key` será o arquivo da chave privada. A opção `-aes256` criptografa a chave privada para maior segurança.

Passo 3: Criar um arquivo de solicitação de assinatura de certificado (CSR)
```
openssl req -new -key myserver.key -out myserver.csr
```
Você será solicitado a preencher algumas informações, como:
- Country Name (Nome do país)
- State (Estado)
- Locality (Cidade)
- Organization Name (Nome da organização)
- Common Name (Nome comum): Normalmente, o nome do domínio (por exemplo, localhost ou meuapp.local ou neste caso para docker `host.docker.internal`).

Passo 4: Criar o certificado autoassinado
```
openssl x509 -req -in myserver.csr -signkey myserver.key -out myserver.crt -days 3650
```
A opção `-days 3650` define o período de validade do certificado para 10 anos.

Passo 5: Instalar o certificado na máquina (opcional, mas recomendável)
Para que o certificado seja confiável localmente, você pode adicioná-lo à lista de autoridades certificadoras (CA) confiáveis.

1- Para Linux (Ubuntu/Debian):
  - Copie o certificado para o diretório de certificados do sistema:
    ```
    sudo cp myserver.crt /usr/local/share/ca-certificates/
    ```
  - Atualize o repositório de certificados:
    ```
    sudo update-ca-certificates
    ```

2- Para Windows:
  - Abra o Certificados (digite `certmgr.msc` na busca).
  - Vá para Autoridades de Certificação Raiz Confiáveis.
  - Clique com o botão direito em Certificados e selecione Importar.
  - Importe o arquivo `myserver.crt`.

Passo 6: Usar o certificado no seu servidor

Agora que você tem o certificado (`myserver.crt`) e a chave privada (`myserver.key`), pode usá-los no seu servidor de desenvolvimento. Por exemplo, se estiver usando o Node.js, configure o seu servidor HTTPS com esses arquivos:
```
const fs = require('fs');
const https = require('https');

const options = {
  key: fs.readFileSync('myserver.key'),
  cert: fs.readFileSync('myserver.crt')
};

https.createServer(options, (req, res) => {
  res.writeHead(200);
  res.end('Hello, secure world!');
}).listen(3000);
```
Isso criará um servidor HTTPS local em `https://localhost:3000`.


#### Usando mkcert

[github.com/FiloSottile/mkcert](https://github.com/FiloSottile/mkcert)

- Instale o chocolatey (windows), execute no powershell como admin
  ```
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  ```
- Instale o mkcert
  ```
  mkcert -install
  ```
- Vá para a pasta `certs` do projeto, se não existir crie e execute o comando:
  ```
  mkcert host.docker.internal
  ```


#### Links interessantes para WordPress

https://youtu.be/GG2k-La5t3o?si=Lwa2sp84wrFmf7L-  Docker Setup for Local WordPress Development
https://youtu.be/HH4s3x1PiA4?si=myZLfxINGdF6RZCD  Adding SSL Support to Your WordPress Docker Setup!

https://youtu.be/XW4WPP8ybqI?si=8_ZyMvpiJPiBweVr Make anything a shortcode for WordPress
