%{
#include <stdio.h>
#include "y.tab.h"
%}

caracter [a-zA-Z]
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
.                                yyerror();
%%
int main()
{
  yylex();
  return 0;
}
