# como compilar estos programas
```
	cc caracteres.c 	# a.out
```

## como usar estos programas compilados
```
	./a.out <<< hola_esto_es_una_entrada # 25 
	./a.out <<< hola esto es una entrada # 5
```
enrealidad se trata de 
```
n-caracteres 
+1caracter EOF 
```
esto se debe a que EOF (end of file) es el caracter que finaliza el conteo de caracteres, esto proviene de la biblioteca estandar de C, es decir, la forma mas basica de este lenguaje, sin librerias adicionales,  en este caso solo usamos la libreria Input/Output, para manejar entradas y salidas. 

## dump
Para ver a detalle el programa que ejecuta *caracteres.c*
```
	objdump -s a.out 
```
Para ver el programa en lenguaje ensamblador
```
	objdump -d ./a.out
```