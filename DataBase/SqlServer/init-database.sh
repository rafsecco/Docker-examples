#!/bin/bash

INIT_FLAG="/var/opt/mssql/.initialized"

echo "Aguardando SQL Server iniciar..."

until /opt/mssql-tools/bin/sqlcmd -S $DB_HOST -U sa -P $DB_PASSWORD -Q "SELECT 1" &> /dev/null
do
  sleep 2
done

echo "SQL Server pronto!"

if [ -f "$INIT_FLAG"]; then
  echo "Banco já inicializado. Rodando scripts."
  exit 0
fi

echo "Executando scripts..."

for script in /tmp/*.sql
do
  echo "Rodando $script"
  /opt/mssql-tools/bin/sqlcmd -S $DB_HOST -U sa -P $DB_PASSWORD -i "$script"
done

touch "$INIT_FLAG"

echo "Inicialização concluída."
