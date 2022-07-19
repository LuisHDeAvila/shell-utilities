# entradas/salidas de bash
```
cmd > file	Enviar salida de cmd a archivo (sobrescribir)
cmd >> file	Enviar salida de cmd al archivo (agregar)
cmd < file	El contenido del archivo se pasa al stdin de cmd
cmd1 | cmd2	La salida de cmd1 se pasa a la entrada estándar de cmd2
cmd &> file	Redirigir tanto stdout como stderr al archivo (sobrescribir)
cmd &>> file	Redirigir tanto stdout como stderr al archivo (adjuntar)
cmd >&n	Enviar la salida estándar de cmd al descriptor de archivo n
cmd m>&n	Igual que el anterior, excepto que la salida que normalmente iría al descriptor de archivo m, también irá a n
cmd <&n	El descriptor de archivo n se convierte en stdin para cmd
cmd m<&n	Igual que el anterior, excepto que la entrada estándar que normalmente vendría del descriptor de archivo m, ahora vendrá de n
cmd >&-	Cerrar salida estándar
cmd <&-	Cerrar entrada estándar
```