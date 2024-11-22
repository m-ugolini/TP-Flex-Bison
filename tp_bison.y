%{ 
#include <stdio.h>
#include "funciones.h"
int yylex();
void yyerror(const char *s);
%} 
%union{
      char* cadena;
      int digito;
}
%token ASIGNACION INICIO FIN LEER ESCRIBIR PUNTOCOMA PARIZQ PARDER SUMA RESTA COMA FDT ERRORLEXICO NO_DEFINIDO
%token <cadena> IDENTIFICADOR
%token <digito> CONSTANTE
%defines "y.tab.h"
%% 
objetivo: programa FDT
;
programa: INICIO listaSentencias FIN { printf("Programa reconocido.\n"); }
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
void yyerror(const char *s) {
    fprintf(stderr, "Error: No pertenece al lenguaje micro %s\n", s);
}
