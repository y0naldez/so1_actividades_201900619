
# README para el Servicio `saludo_fecha.service`

Este documento describe el proceso de instalación y configuración del servicio `saludo_fecha.service`, el cual es un servicio simple de `systemd` diseñado para imprimir "Hola Mundo" y la fecha actual cada vez que se ejecuta.

## Pre-requisitos

Antes de comenzar, asegúrate de tener acceso al sistema como usuario con privilegios de sudo o root, ya que necesitarás estos privilegios para crear archivos en `/etc/systemd/system/` y para habilitar y manejar servicios con `systemd`.

## Instalación

### Paso 1: Crear el Script

1. **Ubicación del Script**: Navega a la carpeta donde deseas almacenar tu script. En este ejemplo, usaremos `/home/bang/Escritorio/actividad3/`.

2. **Crear el Script**: Crea un archivo llamado `saludo_fecha.sh` usando tu editor de texto preferido. Agrega el siguiente contenido al archivo:

```bash
#!/bin/bash
echo "Hola Mundo"
echo "Fecha actual: $(date)"
```

3. **Hacer el Script Ejecutable**: Otorga permisos de ejecución al script con el siguiente comando:

```bash
chmod +x /home/bang/Escritorio/actividad3/saludo_fecha.sh
```

### Paso 2: Crear el Archivo de Servicio de `systemd`

1. **Crear el Archivo de Servicio**: Como superusuario, crea un nuevo archivo en `/etc/systemd/system/` llamado `saludo_fecha.service`. Puedes usar `sudo nano` o tu editor preferido para esto:

```bash
sudo nano /etc/systemd/system/saludo_fecha.service
```

2. **Contenido del Archivo de Servicio**: Añade el siguiente contenido al archivo `saludo_fecha.service`:

```ini
[Unit]
Description=Imprime un saludo y la fecha actual

[Service]
Type=simple
ExecStart=/home/bang/Escritorio/actividad3/saludo_fecha.sh

[Install]
WantedBy=multi-user.target
```

3. **Guardar y Cerrar**: Guarda los cambios y cierra el editor.

### Paso 3: Habilitar y Arrancar el Servicio

1. **Recargar `systemd`**: Para que `systemd` reconozca el nuevo servicio, recarga el daemon de `systemd`:

```bash
sudo systemctl daemon-reload
```

2. **Habilitar el Servicio**: Para que el servicio se inicie automáticamente en el arranque del sistema, habilita el servicio:

```bash
sudo systemctl enable saludo_fecha.service
```

3. **Arrancar el Servicio**: Para iniciar el servicio manualmente sin reiniciar:

```bash
sudo systemctl start saludo_fecha.service
```

### Paso 4: Verificación

Para verificar que el servicio se ha iniciado correctamente y está funcionando como se espera, puedes usar:

```bash
sudo systemctl status saludo_fecha.service
```

Y para ver la salida del script:

```bash
journalctl -u saludo_fecha.service
```

