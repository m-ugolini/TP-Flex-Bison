%{ 
#include <stdio.h>
#include "funciones.h"
int yylex();
extern char* yytext;
extern int yyleng;
void yyerror(const char *s);
%} 
%union{
      char* cadena;
      int digito;
}
%token ASIGNACION INICIO FIN LEER ESCRIBIR PUNTOCOMA PARIZQ PARDER SUMA RESTA COMA FDT ERRORLEXICO NO_DEFINIDO
%token <cadena> IDENTIFICADOR
%token <digito> CONSTANTE
%type <digito> expresion operadorAditivo
%% 
objetivo: programa FDT
;
programa: INICIO listaSentencias FIN {printf("Programa reconocido!\n");}
;
listaSentencias:
|listaSentencias sentencia
;
sentencia: IDENTIFICADOR {printf("Identificador reconocido!\n");printf("La longitud es: %d\n", yyleng);if(yyleng > 32)yyerror("Error: no puede ser mayor a 32");} ASIGNACION expresion PUNTOCOMA
|expresion {printf("Expresion reconocida!\n"),printf("Resultado de la expresion: %d\n", $1);}
|LEER PARIZQ listaIdentificadores PARDER PUNTOCOMA
|ESCRIBIR PARIZQ listaExpresiones PARDER PUNTOCOMA
;
listaIdentificadores: IDENTIFICADOR COMA IDENTIFICADOR
|listaIdentificadores COMA IDENTIFICADOR
;
listaExpresiones: expresion COMA expresion
|listaExpresiones COMA expresion
;
expresion: CONSTANTE operadorAditivo CONSTANTE{if ($2 == '+'){$$ = $1 + $3;} else if ($2 == '-') {$$ = $1 - $3;}}
;
operadorAditivo: SUMA{$$ = '+';}
               | RESTA{$$ = '-';}
;
%% 
int main(){
      yyparse();
      return 0;
}
void yyerror(const char *s) {
    fprintf(stderr, "Error: No pertenece al lenguaje micro %s\n", s);
}
