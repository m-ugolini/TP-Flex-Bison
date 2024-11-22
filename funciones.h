#ifndef funciones
#define funciones
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#define NUMESTADOS 15
#define NUMCOLS 13
#define TAMLEX 32+1
#define TAMNOM 20+1

//DECLARACIONES
FILE * in;
typedef enum {
INICIO, FIN, LEER, ESCRIBIR, ID, CONSTANTE, PARENIZQUIERDO, PARENDERECHO, PUNTOYCOMA,
COMA, ASIGNACION, SUMA, RESTA, FDT, ERRORLEXICO, NO_DEFINIDO
} TOKEN;
typedef struct {
 char identifi[TAMLEX];
 TOKEN t; 
 } RegTS;
RegTS TS[1000] = { {"inicio", INICIO}, {"fin", FIN}, {"leer", LEER}, {"escribir", ESCRIBIR}, {"$", NO_DEFINIDO} };
typedef struct{
 TOKEN clase;
 char nombre[TAMLEX];
 int valor;
 } REG_EXPRESION;
char buffer[TAMLEX];
TOKEN tokenActual;
int flagToken = 0;

//PROTOTIPO RUTINAS SEMANTICAS
REG_EXPRESION ProcesarCte(void);
REG_EXPRESION ProcesarId(void);

//RUTINAS SEMANTICAS
REG_EXPRESION ProcesarCte(void)
{
REG_EXPRESION reg;
reg.clase = CONSTANTE;
strcpy(reg.nombre, buffer);
sscanf(buffer, "%d", &reg.valor);
return reg;
}

REG_EXPRESION ProcesarId(void) {
REG_EXPRESION reg;
Chequear(buffer);
reg.clase = ID;
strcpy(reg.nombre, buffer);
return reg;
}

//FUNCIONES AUXILIARES
void Chequear(char * s){
TOKEN t;
if ( !Buscar(s, TS, &t) ) {
 Colocar(s, TS);
 Generar("Declara", s, "Entera", "");
}
}

int Buscar(char * id, RegTS * TS, TOKEN * t) {
int i = 0;
while ( strcmp("$", TS[i].identifi) ) {
 if ( !strcmp(id, TS[i].identifi) ) {
 *t = TS[i].t;
 return 1;
 }
 i++;
}
return 0;
}
void Colocar(char * id, RegTS * TS){
int i = 4;
while ( strcmp("$", TS[i].identifi) ) i++;
if ( i < 999 ) {
 strcpy(TS[i].identifi, id );
 TS[i].t = ID;
 strcpy(TS[++i].identifi, "$" );
}
}

void Generar(char * co, char * a, char * b, char * c) {
printf("%s %s%c%s%c%s\n", co, a, ',', b, ',', c);
}

#endif