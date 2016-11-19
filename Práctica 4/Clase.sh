#!/bin/bash

Práctica 4.1

1. Crear un usuario 'alumno' dentro del grupo 'alumnos'
groupadd alumnos; useradd alumno -g alumnos

2. Crear un usuario 'invitado' con:
- UID = 1890
- Grupo principal = 'invitado'
- Grupo secundario = 'alumnos'
- Shell = '/bin/bash'
- Caducidad = 4 meses
useradd invitado -u 1890 -G alumnos -s /bin/bash -e "2017-03-02"

3. Modificar usuario 'invitado' para que:
- Caducidad = 1 mes
- Antigüedad mínima = 15 días
- Warning de password = 1 semana
- Periodo de gracia = 1 semana
chage -M 30 -m 15 -W 7 -I 7 invitado

4. Hacer que el usuario 'invitado' sea el administrador del grupo 'alumnos'
gpasswd -A invitado alumnos

5. Script que crea 40 usuarios que pertenezcan a un grupo con una política de contraseñas
- Usuarios: user01 - user02 - ...
- Grupo: myusers
- Directorio: /Users
- Carpeta compartida: /Users/myusers
- Poweruser: No tiene directorio de usuario
- Pólitica: Apartado 3

#!/bin/bash
function createGroup(){
	groupadd -f myusers
	mkdir -p /Users/myusers
	chmod a-rwx,g+rwx /Users/myusers
	chgrp myusers /Users/myusers
}

function createPoweruser(){
	useradd -g myusers -M user00
	gpasswd -A user00 myusers
}

function createUsers(){
	for i in $(seq -f "%02g" 1 40)
	do
		useradd -g myusers -m -d /Users/user$i user$i
		chage -M 30 -m 15 -W 7 -I 7 user$i
	done
}

createGroup
createPoweruser
createUsers

Práctica 4.2

1.- Utilizando la orden tar implementar el siguiente plan de copias de seguridad:

a) Una copia completa (nivel 0) todos los domingos a las 23.59 de todos los archivos de los usuarios prueba 	e invitado.
59 23 * * 0 CompleteBackupTar
    
CompleteBackupTar:
    
b) El resto de días de la semana una compia incremental de nivel 1 a la 23.59 de todos los archivos propiedad de los usuarios prueba e invitado.
59 23 * * 1-6 IncrementalBackupTar
    
IncrementalBackupTar:
    
2.- Implementar el plan anterior usando la orden cpio.

a) Una copia completa (nivel 0) todos los domingos a las 23.59 de todos los archivos de los usuarios prueba e invitado.
59 23 * * 0 CompleteBackupCpio
	
CompleteBackupCpio:
	
b) El resto de días de la semana una compia incremental de nivel 1 a la 23.59 de todos los archivos propiedad de los usuarios prueba e invitado.
59 23 * * 1-6 IncrementalBackupCpio

IncrementalBackupCpio:
	
3.- Utilizando la orden tar implementar el siguiente plan de copias de seguridad, restringido a los archivos propiedad de los usuarios que no son el usuario root y que se encuentran bajo el directorio /home:
    a) Primer lunes del mes: copia total (nivel 0).
    b) Demás lunes del mes: copia incremental de nivel 1.
    c) El resto de días: copia de nivel 2.
55 23 * * 1 (( $(date +"%d") >= 7 )) && CompleteBackupTar || IncrementalBackupTar
55 23 * * 0,2,3,4,5,6 IncrementalBackupTar2


4.- Implementar el plan anterior usando la orden cpio.

5.- Hoy es 15/11/2016. Hemos sabido que el día 30/10/2016 un accidente ha destruido todo el contenido de la carpeta /home/mia. Suponiendo que el plan de copias lleva implantado un año, ejecutar las acciones necesarias para recuperar la carpeta /home/mia al estado más reciente posible (hágalo con el plan basado en tar y con el plan basado en cpio).
6.-
    a)
    b)
    c)
    d) 
    s
