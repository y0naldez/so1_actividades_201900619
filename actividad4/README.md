# Chat Básico con Named Pipes en Bash

Este documento describe cómo configurar y usar un chat básico entre dos participantes en un sistema Linux, utilizando named pipes (FIFOs) y scripts de Bash.

## Configuración Inicial

Antes de iniciar el chat, necesitas preparar el entorno creando los named pipes y asegurándote de que los scripts de Bash tengan los permisos adecuados para ejecutarse.

### Crear Named Pipes

Abre una terminal y navega al directorio donde deseas colocar los archivos del chat. Ejecuta los siguientes comandos para crear dos named pipes, uno para cada dirección de la comunicación:

```bash
mkfifo chat_pipe1
mkfifo chat_pipe2` 
```

### Preparar los Scripts

Asegúrate de tener dos scripts, `read.sh` y `write.sh`, en el mismo directorio. Estos scripts permitirán leer y enviar mensajes, respectivamente.

#### Script de Lectura (`read.sh`)

El script `read.sh` se utiliza para leer mensajes del named pipe. Aquí está el contenido del script:

```bash
#!/bin/bash

# El primer argumento es el nombre del pipe
PIPE=$1
# El segundo argumento es el identificador del usuario (opcional)
USER_ID=${2:-"Usuario"}

trap "rm -f $PIPE" EXIT

while true; do
    if read line <$PIPE; then
        echo "$USER_ID: $line"
    fi
done

```
#### Script de Escritura (`write.sh`)

El script `write.sh` se utiliza para escribir mensajes en el named pipe. Aquí está el contenido del script:

```bash

#!/bin/bash

PIPE=$1

while true; do
    read input
    echo "$input" >$PIPE
done
```

### Hacer los Scripts Ejecutables

Otorga permisos de ejecución a ambos scripts con el siguiente comando:


```bash
chmod +x read.sh write.sh
```

## Uso del Chat

Para iniciar el chat, cada participante debe abrir dos terminales: una para leer mensajes y otra para escribirlos.

### Usuario 1

En el terminal 1, para leer mensajes enviados por el Usuario 2:
```bash
./read.sh chat_pipe2 "Usuario1"
```

En el terminal 2, para enviar mensajes al Usuario 2:

```bash
./write.sh chat_pipe1 
```
### Usuario 2

En el terminal 1, para leer mensajes enviados por el Usuario 1:

```bash
./read.sh chat_pipe1 "Usuario2"
```

En el terminal 2, para enviar mensajes al Usuario 1:

```bash
./write.sh chat_pipe2
```

