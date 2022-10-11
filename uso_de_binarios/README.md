# Manejo de binarios
Compilacion,  es el proceso de convertir codigo fuente, a instrucciones de maquina, y esto lo realiza un compilador, como resultado obtenemos un fichero ejecutable en binario, o programa compilado.
### Practica
A traves del siguiente comando, y con el archivo de codigo fuente que se encuentra en este directorio llamado: caracteres.c podemos producir un fichero ejecutable.
```
	cc caracteres.c 	# a.out
```

## Como usar
```
	./a.out <<< hola_esto_es_una_entrada # 25 caracteres
	./a.out <<< hola esto es una entrada # 5 caracteres
```
enrealidad se trata de 
```
 # [n] caracteres + 1 caracter EOF
```

esto se debe a que EOF (end of file) es el caracter que finaliza el conteo de caracteres, esto proviene de la biblioteca estandar de C, es decir, la forma mas basica de este lenguaje, sin librerias adicionales,  en este caso solo usamos la libreria Input/Output, para manejar entradas y salidas. 

## Un poco de ingenieria inversa:
Para ver a detalle el programa que ejecuta *caracteres.c*
```
	objdump -s a.out 
```
Para ver el programa en lenguaje ensamblador
```
	objdump -d ./a.out
```

# ejemplo de shellcode
