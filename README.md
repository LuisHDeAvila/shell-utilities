# Shell Scripting
Repositorio dedicado a desarrollo de shell scripting con BASH (bourne again shell).

se abordan aspectos importantes del sistema operativo, como ejemplo, el script 05_copias_de_seguridad.sh trata de persistencia de la informacion y control de versiones.
Es de mucha utilidad cuando trabajo con sistemas operativos lanzados desde un pendrive, y deseo guardar todo lo que se haya creado en el directorio de usuario, que por supuesto es un usuario temporal, que existe solo en la memoria ram, y en el momento de apagar el sistema, ese directorio de usuario es eliminado, lo que se traduce como perdida de informacion.
```
#: fdisk -l
#: mount /dev/sda3 /mnt
#: bash 01_copias_de_seguridad.sh
####### from /home/user to /mnt #####
#: poweroff
```

en fin, solo explico estas cosas para aburrir a los curiosos. explora un poco las posibilidades. imagina cambiar la realidad, modificando el orden de los sucesos, y luego hazlo con el script 04_metadata, para que puedas afirmar con toda seguridad que de ningun modo puedes aceptar la responsabilidad por algo que sucedio el 30 de febrero. (ja ja)

## Contenido
#### script: configura la linea de comandos para ejecutar scripts
```
  00_scripts_to_commands
```
#### script: copias de seguridad de un directorio.
```
  01_copias_de_seguridad.sh
```

#### script: gestion de metadatos
```
  04_metadata.sh
```
#### script: traduccion solamente de los comentarios, sin afectar el codigo de un script
```
  08_accesibility_lang
```
#### script: enumeracion de archivos por extension
```
  05_enumeracion_userdir
```
