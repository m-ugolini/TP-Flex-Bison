%{ 
#include <stdio.h>
#include "funciones.h"
%} 
%union{
      char* cadena;
      int digito;
}
%% 
%token ASIGNACION RESERVADA PUNTOCOMA PARIZQ PARDER SUMA RESTA COMA
%token <cadena> IDENTIFICADOR
%token <digito> CONSTANTE
%% 
int main(){
return 0;
//LLAMAR RUTINAS SEMANTICAS QUE ESTEN EN FUNCIONES.H, EJEMPLO QUE LOS ID SON MAX 32 CARACTERES
}
void yyerror(){
printf("ERROR: No pertenece al lenguaje micro");
}
