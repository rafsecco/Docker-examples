# 🧠 Cheatsheet / Comandos úteis

## 📦 Git

```bash
git status
git add .
git commit -m "mensagem"
git push
```

### Criar branch

```bash
git checkout -b nome-da-branch
```

### Atualizar branch

```bash
git pull origin main
```

---

## 🚀 Rodar o projeto

```bash
npm install
npm run dev
```

---

## 🧹 Limpar cache

```bash
npm cache clean --force
```

---

## 🐳 Docker

### Subir containers

```bash
docker-compose up -d
```

### Derrubar

```bash
docker-compose down
```

---

## 🔧 Variáveis de ambiente

```bash
cp .env.example .env
```

---

## 📌 Observações

* Nunca subir `.env`
* Usar Node versão 18+
* Rodar lint antes de commit

#### Você pode chamar de várias formas:

COMMANDS.md
CHEATSHEET.md
DEV_NOTES.md
DOCS.md
