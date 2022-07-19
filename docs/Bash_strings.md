# funciones de bash para strings, chars y regex
```
${var:pos}	Extrae la subcadena de var en pos
${var:pos:len}	Extrae len caracteres de subcadena de var en pos
${var:-val}	Si $var existe y no es NULL, devuelve su valor; de lo contrario devolver val
${var:=val}	Si $var existe y no es NULL, devuelve su valor; de lo contrario, configúrelo en val y luego devuelva su valor
${var:?val}	Si $var existe y no es NULL, devuelve su valor; de lo contrario, devuelva 'var: val' y cancele
${var:?}	Si $var existe y no es NULL, devuelve su valor; de lo contrario, devuelva 'var: parámetro nulo o no establecido' y cancele
${var:+val}	Si $var existe y no es NULL, devuelve val; de lo contrario devuelve NULL
$((...))	Expansión Aritmética
${#var}	Operador de longitud de cadena
${str#substr}	Elimina la coincidencia más corta de substr desde el frente de str
${str##substr}	Elimina la coincidencia más larga de substr desde el frente de str
${str%substr}	Elimina la coincidencia más corta de substr de la parte posterior de str
${str%%substr}	Elimina la coincidencia más larga de substr de la parte posterior de str
${str/substr/val}	Reemplace la primera coincidencia de substr con val
${str//substr/val}	Reemplace todas las coincidencias de substr con val
${str/#substr/val}	Si $substr coincide con el extremo frontal de str, sustituya val por substr
${str/%substr/val}	Si $substr coincide con el final de str, sustituya val por substr
${str^substr}	Mayúsculas de la primera coincidencia de substr. Un patrón vacío selecciona el primer carácter.
${str^^substr}	Mayúsculas de todas las coincidencias de substr. Un patrón vacío selecciona toda la cadena.
${str,substr}	Primera coincidencia en minúsculas de substr. Un patrón vacío selecciona el primer carácter.
```