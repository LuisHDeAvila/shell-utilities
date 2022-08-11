# Shell Scripting
Repositorio dedicado a desarrollo de *shell scripting* con BASH* (bourne again shell).

se abordan aspectos importantes del sistema operativo, como ejemplo, el script 05_copias_de_seguridad.sh trata de persistencia de la informacion y control de versiones.
Representa una solucion para el siguiente problema: cuando trabajo con sistemas operativos booteados desde un pendrive//liveusb, y deseo guardar todo lo que se haya creado en el directorio de usuario (cookies, dotfiles, metadatos, archivos multimedia, ficheros de extracto, etc) se vuelve muy redundante porque se trata de un usuario temporal que existe solo en la memoria ram, asi que al apagar el sistema, ese directorio de usuario es eliminado, lo que se traduce como perdida de informacion valiosa, una opcion es configurar persistencia en el pendrive//liveusb pero esto no es lo adecuado porque tambien las configuraciones se vuelven persistentes, y no siempre es necesario configurar el sistema que ya viene por defecto en el booteable, asi que esta solucion es perfecta para resolver dicha necesidad, ejemplo de uso de este script:
```
#: fdisk -l
#: mount /dev/sda3 /mnt
#: bash 01_copias_de_seguridad.sh
####### <<< /home/user 
####### <<< /mnt
#: poweroff
```

en fin, solo explico estas cosas para aburrir a los curiosos. explora un poco las posibilidades. imagina cambiar la realidad, modificando el orden de los sucesos, y luego hazlo realidad con el script 04_metadata, para que puedas afirmar con toda seguridad que de ningun modo puedes aceptar la responsabilidad por algo que sucedio el 30 de febrero. (ja ja)

## Contenido
#### script: configura la linea de comandos para ejecutar scripts creados por el usuario
```
  00_scripts_to_commands
```
#### script: copias de seguridad de un directorio.
```
  01_copias_de_seguridad.sh
```

#### script: lee, borra, modifica o agrega metadatos
```
  04_metadata.sh
```

#### script: traduce desde cualquier idioma, unicamente los comentarios en el codigo, sin afectar el codigo (util para entender los scripts comentados en ruso)
```
  08_accesibility_lang
```

#### script: enumeracion verbosa de archivos por extension.
```
  05_enumeracion_userdir
```

#### script: encriptacion.
```
  11_encrypt.sh
```