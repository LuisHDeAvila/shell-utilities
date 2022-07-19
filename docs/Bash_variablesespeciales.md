# Variables especiales de bash
```
!$	Último argumento del último comando
$<N>	N-ésimo argumento del proceso actual (parámetro posicional)
$#	Número de argumentos dados al proceso actual
$@	Argumentos de línea de comando para el proceso actual
$*	Sin comillas, igual que '$@'
"$*"	Argumentos de línea de comando para el proceso actual, expandidos a un solo argumento
$0	El nombre del programa shell.
$?	Código de salida del comando anterior
$$	PID del shell o script actual
:	Marcador de posición ficticio (no produce salida)
!-<N>	Ejecutar el comando N de la historia
!!	Ejecutar último comando
!<string>	Ejecutar el último comando que comienza con <string>
```