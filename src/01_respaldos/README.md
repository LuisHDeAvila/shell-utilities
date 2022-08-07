# 01_copias_de_seguridad.sh
Este script crea copias de seguridad totales, diferenciales (detecta si hubo cambios con respecto a la copia de seguridad anterior del directorio) e incrementales (actualiza el contenido de la copia de seguridad).

# Uso
Al ejecutar este script, le solicitara 2 rutas absolutas:
1. un directorio del cual se creara copia de seguridad
2. un directorio donde se almacenaran las copias de seguridad

EJEMPLO: 
```
	/home/user/.config # origen
	/mnt/dotfiles # destino
```
