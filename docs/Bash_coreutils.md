# Tipos de programas
### Algunas observaciones sobre el alcance de estas practicas.

En la mayoria de los sistemas se encuentran al menos cinco tipos basicos de programas.

1. programas de infrome
2. programas de extracto
3. programas de edicion de entrada (sirven para validar los datos de un archivo)
4. programas de actualizacion
5. programas de utileria

En el caso de programas de utileria, los puede proporcionar el fabricante o una empresa dedicada a la produccion de software o escribirlos el usuario. efectuan funciones estandarizadas tales como clasificar datos en en una secuencia especifica, unir dos o mas archivos en uno, copiar registros de un archivo a otro y hacer listados simples de datos de informes.

#### Core-utils, en Linux
Los core utils son el stack de herramientas de las que dispone bash, representando los programas de utileria (del 5 tipo de programa de sistema), y ofrecen implementaciones que solucionan un problema en especifico, aunque si lo desea, puede revisar el codigo fuente de todos y cada uno para crear versiones adaptadas a sus necesidades y compilarlas en binarios.

```
  git clone git://git.sv.gnu.org/coreutils
```
Un binario se ejecuta mucho mas rapido que un script.

El procedimiento para desarrollar esas versiones, es el mismo que haria para compilar programas en C.

En la informatica aplicamos matematicas un poco diferentes a las de la educacion tradicional. Si quiere saber mas de esto, consulte: teoria de juegos, teoria de grafos, teoria de conjuntos. Busque algunos ejercicios y resuelvalos sin ayuda para que comprenda mejor de que le estoy hablando.

### Help
```
 id_trabajo [&]                        history [-c] [-d despl] [n] o hist>
 (( expresión ))                       if ÓRDENES; then ÓRDENES; [ elif Ó>
 . fichero [argumentos]                jobs [-lnprs] [idtrabajo ...] o jo>
 :                                     kill [-s id_señal | -n num_señal |>
 [ arg... ]                            let arg [arg ...]
 [[ expresión ]]                       local [opción] nombre[=valor] ...
 alias [-p] [nombre[=valor] ... ]      logout [n]
 bg [id_trabajo ...]                   mapfile [-d delim] [-n cuenta] [-O>
 bind [-lpsvPSVX] [-m comb_teclas] [>  popd [-n] [+N | -N]
 break [n]                             printf [-v var] formato [argumento>
 builtin [orden-interna-shell [arg .>  pushd [-n] [+N | -N | dir
 caller [expresión]                    pwd [-LP]
 case PALABRA in [PATRÓN [| PATRÓN].>  read [-ers] [-a matriz] [-d delim]>
 cd [-L|[-P [-e]]] [dir]               readarray [-d delim] [-n cuenta] [>
 command [-pVv] orden [arg ...]        readonly [-aAf] [nombre[=valor] ..>
 compgen [-abcdefgjksuv] [-o option]>  return [n]
 complete [-abcdefgjksuv] [-pr] [-DE>  select NOMBRE [in PALABRAS ... ;] >
 compopt [-o|+o opción] [-DEI] [nomb>  set [-abefhkmnptuvxBCHP] [-o nombr>
 continue [n]                          shift [n]
 coproc [NOMBRE] orden [redireccione>  shopt [-pqsu] [-o] [nombre_opción.>
 declare [-aAfFgiIlnrtux] [-p] [name>  source fichero [argumentos]
 dirs [-clpv] [+N] [-N]                suspend [-f]
 disown [-h] [-ar] [idtrabajo ... | >  test [expresión]
 echo [-neE] [arg ...]                 time [-p] tubería
 enable [-a] [-dnps] [-f fichero] [n>  times
 eval [arg ...]                        trap [-lp] [[arg] id_señal ...]
 exec [-cl] [-a name] [command [argu>  true
 exit [n]                              type [-afptP] nombre [nombre ...]
 export [-fn] [nombre[=valor] ...] ó>  typeset [-aAfFgiIlnrtux] [-p] name>
 false                                 ulimit [-SHabcdefiklmnpqrstuvxPT] >
 fc [-e nombre_e] [-lnr] [primero] [>  umask [-p] [-S] [modo]
 fg [id_trabajo]                       unalias [-a] nombre [nombre ...]
 for NOMBRE [in PALABRAS ... ] ; do >  unset [-f] [-v] [-n] [nombre ...]
 for (( exp1; exp2; exp3 )); do ÓRDE>  until ÓRDENES; do ÓRDENES; done
 function nombre { ÓRDENES ; } o nom>  variables - Nombres y significados>
 getopts optstring name [arg ...]      wait [-fn] [-p var] [id ...]
 hash [-lr] [-p ruta] [-dt] [nombre >  while ÓRDENES; do ÓRDENES; done
 help [-dms] [patrón ...]              { ÓRDENES ; }
```
#### Comentario
Tuve que aprender las interfaces del sistema unix, para darme cuenta que bash era la pieza perfecta que faltaba entre sistemas, aplicaciones y logica computacional.
