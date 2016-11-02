#!/bin/bash

# Crear un usuario 'alumno' dentro del grupo 'alumnos'
groupadd alumnos; useradd alumno -g alumnos

# Crear un usuario 'invitado' con:
# - UID = 1890
# - Grupo principal = 'invitado'
# - Grupo secundario = 'alumnos'
# - Shell = '/bin/bash'
# - Caducidad = 4 meses
useradd invitado -u 1890 -g invitado -G alumnos -s /bin/bash -e "2017-03-02"

# Modificar usuario 'invitado' para que:
# - Caducidad = 1 mes
# - Antigüedad mínima = 15 días
# - Warning de password = 1 semana
# - Periodo de gracia = 1 semana
chage -M 30 -m 15 -W 7 -I 7 invitado
