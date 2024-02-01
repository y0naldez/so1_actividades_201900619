#!/bin/bash

# Leer la variable de entorno GITHUB_USER
GITHUB_USER=${GITHUB_USER}

# Verificar si GITHUB_USER está vacío
if [ -z "$GITHUB_USER" ]; then
  echo "La variable GITHUB_USER está vacía. Por favor, establezca la variable y vuelva a intentarlo."
  exit 1
fi

# Consultar la API de GitHub
response=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# Verificar si la respuesta es vacía
if [ -z "$response" ]; then
  echo "No se pudo obtener información para el usuario $GITHUB_USER"
  exit 1
fi

# Extraer los datos necesarios del JSON
user_name=$(echo $response | jq -r '.login')
user_id=$(echo $response | jq -r '.id')
created_at=$(echo $response | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $user_name. User ID: $user_id. Cuenta fue creada el: $created_at."

# Crear el directorio para el log si no existe
log_dir="/tmp/$(date +%F)"
mkdir -p "$log_dir"

# Crear/Actualizar el archivo de log
log_file="$log_dir/saludos.log"
echo "Hola $user_name. User ID: $user_id. Cuenta fue creada el: $created_at." >> "$log_file"
