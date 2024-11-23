%{
#define YY_NO_MAIN
#include <stdio.h>
#include "y.tab.h"
void yyerror(const char *s);
%}
%option noyywrap

caracter [a-zA-Z_]
digito [0-9]

%%
"inicio"                         {return INICIO;}
"fin"                            {return FIN;}
"leer"                           {return LEER;}
"escribir"                       {return ESCRIBIR;}
"+"                              {return SUMA;}
"-"                              {return RESTA;}
","                              {return COMA;}
";"                              {return PUNTOCOMA;}
"("                              {return PARIZQ;}
")"                              {return PARDER;}
"=:"                             {return ASIGNACION;}
{caracter}({caracter}|{digito})* {return IDENTIFICADOR;}
{digito}+                        {return CONSTANTE;}
.                                {printf("Error léxico: %s\n", yytext);}
%%

