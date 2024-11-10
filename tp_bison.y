%{ 
#include <stdio.h>
#include "funciones.h"
%} 
%union{
      char* cadena;
      int digito;
}
%token ASIGNACION INICIO FIN LEER ESCRIBIR PUNTOCOMA PARIZQ PARDER SUMA RESTA COMA
%token <cadena> IDENTIFICADOR
%token <digito> CONSTANTE
%% 
sentencias: sentencias sentencia
 |sentencia
;

sentencia: ID {if(yyleng>=32) {yyerror("Los identificadores no deben superar los 32 caracteres");}}ASIGNACION
%% 
int main(){
      yyparse();
      return 0;
}
void yyerror(){
printf("ERROR: No pertenece al lenguaje micro");
}
