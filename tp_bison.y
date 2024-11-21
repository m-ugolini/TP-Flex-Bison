%{ 
#include <stdio.h>
#include "funciones.h"
%} 
%union{
      char* cadena;
      int digito;
}
%token ASIGNACION INICIO FIN LEER ESCRIBIR PUNTOCOMA PARIZQ PARDER SUMA RESTA COMA FDT
%token <cadena> IDENTIFICADOR
%token <digito> CONSTANTE
%% 
objetivo: programa FDT
;
programa: INICIO listaSentencias FIN
;
listaSentencias: sentencia sentencia
;
sentencia: IDENTIFICADOR ASIGNACION expresion PUNTOCOMA
|LEER PARIZQ listaIdentificadores PARDER PUNTOCOMA
|ESCRIBIR PARIZQ listaExpresiones PARDER PUNTOCOMA
;
listaIdentificadores: IDENTIFICADOR COMA IDENTIFICADOR
;
listaExpresiones: expresion COMA expresion
;
expresion: CONSTANTE operadorAditivo CONSTANTE
;
operadorAditivo: SUMA
|RESTA
;

%% 
int main(){
      yyparse();
      return 0;
}
void yyerror(){
printf("ERROR: No pertenece al lenguaje micro");
}
