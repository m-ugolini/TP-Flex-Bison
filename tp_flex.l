%{
#include <stdio.h>
#include "y.tab.h"
%}
%option noyywrap

caracter [a-zA-Z]
digito [0-9]

%%
"inicio"                         return RESERVADA;
"fin"                            return RESERVADA;
"leer"                           return RESERVADA;
"escribir"                       return RESERVADA;
"+"                              return SUMA;
"-"                              return RESTA;
","                              return COMA;
";"                              return PUNTOCOMA;
"("                              return PARIZQ;
")"                              return PARDER;
"=:"                             return ASIGNACION;
{caracter}({caracter}|{digito})* return IDENTIFICADOR;
{digito}+                        return CONSTANTE;
.                                yyerror();
%%
int main()
{
  yylex();
  return 0;
}
