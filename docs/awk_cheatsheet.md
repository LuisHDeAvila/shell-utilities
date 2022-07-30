HANDY ONE-LINE SCRIPTS FOR AWK                               30 April 2008
Compiled by Eric Pement - eric [at] pement.org               version 0.27

Latest version of this file (in English) is usually at:
http://www.pement.org/awk/awk1line.txt

This file will also be available in other languages:
Chinese  - http://ximix.org/translation/awk1line_zh-CN.txt

USAGE:

Unix: awk '/pattern/ {print "$1"}'  # shells estándar de Unix
DOS/Win: awk '/pattern/ {print "$1"}'  # compilado con DJGPP, Cygwin
awk "/pattern/ {print "$1"}"  # GnuWin32, UnxUtils, Mingw

Note that the DJGPP compilation (for DOS or Windows-32) permits an awk
script to follow Unix quoting syntax '/like/ {"this"}'. HOWEVER, if the
command interpreter is CMD.EXE or COMMAND.COM, single quotes will not
protect the redirection arrows (<, >) nor do they protect pipes (|).
These are special symbols which require "double quotes" to protect them
from interpretation as operating system directives. If the command
interpreter is bash, ksh or another Unix shell, then single and double
quotes will follow the standard Unix usage.

Users of MS-DOS or Microsoft Windows must remember that the percent
sign (%) is used to indicate environment variables, so this symbol must
be doubled (%%) to yield a single percent sign visible to awk.

If a script will not need to be quoted in Unix, DOS, or CMD, then I
normally omit the quote marks. If an example is peculiar to GNU awk,
the command 'gawk' will be used. Please notify me if you find errors or
new commands to add to this list (total length under 65 characters). I
usually try to put the shortest script first. To conserve space, I
normally use '1' instead of '{print}' to print each line. Either one
will work.

FILE SPACING:

 # doble espacio un archivo
awk '1;{print ""}'
awk 'BEGIN{ORS="nn"};1'

 # doble espacio en un archivo que ya tiene líneas en blanco. Archivo de salida
 # no debe contener más de una línea en blanco entre líneas de texto.
 # NOTA: En los sistemas Unix, las líneas DOS que solo tienen CRLF (rn) son
 # a menudo se trata como no en blanco y, por lo tanto, solo 'NF' devolverá VERDADERO.
awk 'NF{print $0 "n"}'

 # triple espacio un archivo
awk '1;{print "n"}'

NUMBERING AND CALCULATIONS:

 # preceda cada línea por su número de línea PARA ESE ARCHIVO (alineación izquierda).
 # El uso de una tabulación (t) en lugar de un espacio preservará los márgenes.
awk '{print FNR "t" $0}' files*

 # preceda cada línea por su número de línea PARA TODOS LOS ARCHIVOS JUNTOS, con tabulador.
awk '{print NR "t" $0}' files*

 # numerar cada línea de un archivo (número a la izquierda, alineado a la derecha)
 # Doble los signos de porcentaje si escribe desde el símbolo del sistema de DOS.
awk '{printf("%5d : %sn", NR,$0)}'

 # numere cada línea del archivo, pero solo imprima números si la línea no está en blanco
 # Recuerde las advertencias sobre el tratamiento de Unix de r (mencionado anteriormente)
awk 'NF{$0=++a " :" $0};1'
awk '{print (NF? ++a " :" :"") $0}'

 # contar líneas (emula "wc -l")
awk 'END{print NR}'

 # imprimir las sumas de los campos de cada línea
awk '{s=0; for (i=1; i<=NF; i++) s=s+$i; print s}'

 # agregue todos los campos en todas las líneas e imprima la suma
awk '{for (i=1; i<=NF; i++) s=s+$i}; END{print s}'

 # imprime cada línea después de reemplazar cada campo con su valor absoluto
awk '{for (i=1; i<=NF; i++) if ($i < 0) $i = -$i; print }'
awk '{for (i=1; i<=NF; i++) $i = ($i < 0) ? -$i : $i; print }'

 # imprimir el número total de campos ("palabras") en todas las líneas
awk '{ total = total + NF }; END {print total}' file

 # imprime el número total de líneas que contienen "Beth"
awk '/Beth/{n++}; END {print n+0}' file

 # imprime el primer campo más grande y la línea que lo contiene
 # Destinado a encontrar la cadena más larga en el campo
awk '$1 > max {max=$1; maxline=$0}; END{ print max, maxline}'

 # imprime el número de campos en cada línea, seguido de la línea
awk '{ print NF ":" $0 } '

 # imprimir el último campo de cada línea
awk '{ print $NF }'

 # imprimir el último campo de la última línea
awk '{ field = $NF }; END{ print field }'

 # imprimir cada línea con más de 4 campos
awk 'NF > 4'

 # imprime cada línea donde el valor del último campo es > 4
awk '$NF > 4'

STRING CREATION:

 # crear una cadena de una longitud específica (por ejemplo, generar 513 espacios)
awk 'BEGIN{while (a++<513) s=s " "; print s}'

 # insertar una cadena de longitud específica en una determinada posición de carácter
 # Ejemplo: inserte 49 espacios después de la columna
gawk --re-interval 'BEGIN{while(a++<49)s=s " "};{sub(/^.{6}/,"&" s)};1'

ARRAY CREATION:

 # Estas próximas 2 entradas no son guiones de una línea, sino la técnica
 # es tan útil que merece su inclusión aquí.

 # cree una matriz llamada "mes", indexada por números, de modo que mes[1]
 # es 'Jan', month[2] es 'Feb', month[3] es 'Mar' y así sucesivamente.
split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", month, " ")

 # crear una matriz llamada "mdigit", indexada por cadenas, de modo que
 # mdigit["Jan"] es 1, mdigit["Feb"] es 2, etc. Requiere matriz de "mes"
for (i=1; i<=12; i++) mdigit[month[i]] = i

TEXT CONVERSION AND SUBSTITUTION:

 # EN UN ENTORNO UNIX: convertir líneas nuevas de DOS (CR/LF) a formato Unix
awk '{sub(/r$/,"")};1'  # asume que CADA línea termina con Ctrl-M

 # EN UN ENTORNO UNIX: convierta Unix newlines (LF) a formato DOS
awk '{sub(/$/,"r")};1'

 # EN ENTORNO DOS: convierta Unix newlines (LF) a formato DOS
awk 1

 # EN ENTORNO DOS: convertir líneas nuevas de DOS (CR/LF) a formato Unix
 # No se puede hacer con versiones DOS de awk, excepto gawk:
gawk -v BINMODE="w" '1' infile >outfile

 # Utilice "tr" en su lugar.
tr -d r <infile >outfile  # GNU tr versión 1.22 o superior

 # elimine los espacios en blanco iniciales (espacios, tabulaciones) del frente de cada línea
 # alinea todo el texto a la izquierda
awk '{sub(/^[ t]+/, "")};1'

 # elimine los espacios en blanco finales (espacios, tabulaciones) del final de cada línea
awk '{sub(/[ t]+$/, "")};1'

 # elimine AMBOS espacios en blanco iniciales y finales de cada línea
awk '{gsub(/^[ t]+|[ t]+$/,"")};1'
awk '{$1=$1};1'  # también elimina el espacio adicional entre campos

 # inserte 5 espacios en blanco al comienzo de cada línea (haga un desplazamiento de página)
awk '{sub(/^/, "     ")};1'

 # alinear todo el texto alineado a la derecha en un ancho de 79 columnas
awk '{printf "%79sn", $0}' file*

 # centrar todo el texto en un ancho de 79 caracteres
awk '{l=length();s=int((79-l)/2); printf "%"(s+l)"sn",$0}' file*

 # sustituir (buscar y reemplazar) "foo" con "bar" en cada línea
awk '{sub(/foo/,"bar")}; 1'  # reemplazar solo 1ra instancia
gawk '{$0=gensub(/foo/,"bar",4)}; 1'  # reemplazar solo 4ta instancia
awk '{gsub(/foo/,"bar")}; 1'  # reemplazar TODAS las instancias en una línea

 # sustituya "foo" por "bar" SOLAMENTE para líneas que contengan "baz"
awk '/baz/{gsub(/foo/, "bar")}; 1'

 # sustituya "foo" por "bar" EXCEPTO para las líneas que contienen "baz"
awk '!/baz/{gsub(/foo/, "bar")}; 1'

 # cambiar "escarlata" o "rubí" o "puce" a "rojo"
awk '{gsub(/scarlet|ruby|puce/, "red")}; 1'

 # orden inverso de las líneas (emula "tac")
awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' file*

 # si una línea termina con una barra invertida, agregue la siguiente línea (falla si
 # hay varias líneas que terminan con barra invertida...)
awk '/\$/ {sub(/\$/,""); getline t; print $0 t; next}; 1' file*

 # imprimir y ordenar los nombres de inicio de sesión de todos los usuarios
awk -F ":" '{print $1 | "sort" }' /etc/passwd

 # imprime los 2 primeros campos, en orden inverso, de cada línea
awk '{print $2, $1}' file

 # cambiar los primeros 2 campos de cada línea
awk '{temp = $1; $1 = $2; $2 = temp}' file

 # imprimir cada línea, eliminando el segundo campo de esa línea
awk '{ $2 = ""; print }'

 # imprimir en orden inverso los campos de cada línea
awk '{for (i=NF; i>0; i--) printf("%s ",$i);print ""}' file

 # concatenar cada 5 líneas de entrada, usando un separador de coma
 # entre campos
awk 'ORS=NR%5?",":"n"' file

SELECTIVE PRINTING OF CERTAIN LINES:

 # imprime las primeras 10 líneas del archivo (emula el comportamiento de "cabeza")
awk 'NR < 11'

 # imprime la primera línea del archivo (emula "head -1")
awk 'NR>1{exit};1'

 # imprime las últimas 2 líneas de un archivo (emula "tail -2")
awk '{y=x "n" $0; x=$0};END{print y}'

 # imprime la última línea de un archivo (emula "tail -1")
awk 'END{print}'

 # imprimir solo líneas que coincidan con la expresión regular (emula "grep")
awk '/regex/'

 # imprime solo líneas que NO coinciden con expresiones regulares (emula "grep -v")
awk '!/regex/'

 # imprimir cualquier línea donde el campo
awk '$5 == "abc123"'

 # imprima solo aquellas líneas donde el campo
 # Esto también imprimirá líneas que tienen menos de 5 campos.
awk '$5 != "abc123"'
awk '!($5 == "abc123")'

 # hacer coincidir un campo con una expresión regular
awk '$7 ~ /^[a-f]/'  # línea de impresión si campo
awk '$7 !~ /^[a-f]/'  # línea de impresión si campo

 # imprime la línea inmediatamente antes de una expresión regular, pero no la línea
 # que contiene la expresión regular
awk '/regex/{print x};{x=$0}'
awk '/regex/{print (NR==1 ? "match on line 1" : x)};{x=$0}'

 # imprime la línea inmediatamente después de una expresión regular, pero no la línea
 # que contiene la expresión regular
awk '/regex/{getline;print}'

 # grep para AAA y BBB y CCC (en cualquier orden en la misma línea)
awk '/AAA/ && /BBB/ && /CCC/'

 # grep para AAA y BBB y CCC (en ese orden)
awk '/AAA.*BBB.*CCC/'

 # imprimir solo líneas de 65 caracteres o más
awk 'length > 64'

 # imprimir solo líneas de menos de 65 caracteres
awk 'length < 64'

 # imprimir la sección del archivo desde la expresión regular hasta el final del archivo
awk '/regex/,0'
awk '/regex/,EOF'

 # sección de impresión del archivo basada en números de línea (líneas 8-12, inclusive)
awk 'NR==8,NR==12'

 # línea de impresión número 52
awk 'NR==52'
awk 'NR==52 {print;exit}'  # más eficiente en archivos grandes

 # sección de impresión del archivo entre dos expresiones regulares (inclusive)
awk '/Iowa/,/Montana/'  # distingue mayúsculas y minúsculas

SELECTIVE DELETION OF CERTAIN LINES:

 # elimine TODAS las líneas en blanco de un archivo (lo mismo que "grep '.' ")
awk NF
awk '/./'

 # eliminar líneas consecutivas duplicadas (emula "uniq")
awk 'a !~ $0; {a=$0}'

 # eliminar líneas duplicadas, no consecutivas
awk '!a[$0]++'  # guión más conciso
awk '!($0 in a){a[$0];print}'  # guión más eficiente

CREDITS AND THANKS:

Special thanks to the late Peter S. Tillier (U.K.) for helping me with
the first release of this FAQ file, and to Daniel Jana, Yisu Dong, and
others for their suggestions and corrections.

For additional syntax instructions, including the way to apply editing
commands from a disk file instead of the command line, consult:

"sed & awk, 2nd Edition," by Dale Dougherty and Arnold Robbins
(O'Reilly, 1997)

"UNIX Text Processing," by Dale Dougherty and Tim O'Reilly (Hayden
Books, 1987)

"GAWK: Effective awk Programming," 3d edition, by Arnold D. Robbins
(O'Reilly, 2003) or at http://www.gnu.org/software/gawk/manual/

To fully exploit the power of awk, one must understand "regular
expressions." For detailed discussion of regular expressions, see
"Mastering Regular Expressions, 3d edition" by Jeffrey Friedl (O'Reilly,
2006).

The info and manual ("man") pages on Unix systems may be helpful (try
"man awk", "man nawk", "man gawk", "man regexp", or the section on
regular expressions in "man ed").

USE OF 't' IN awk SCRIPTS: For clarity in documentation, I have used
't' to indicate a tab character (0x09) in the scripts.  All versions of
awk should recognize this abbreviation.

