algoritmo "variaveis"
// Fun��o :
// Autor :
// Data : 11/8/2012
// Se��o de Declara��es 
var
valor1, valor2, resultado : real //vari�veis globais

//fun��o soma
funcao SOMA(v1, v2 : real) : real
var
total : real   //vari�veis locais
inicio
total <- v1 + v2
retorne total
fimfuncao

inicio
escreva ("Informe o valor de 1: ")
leia (valor1)
escreva ("Informe o valor de 2: ")
leia (valor2)
resultado <- SOMA(valor1, valor2)
escreva ("Resultado da soma: ", resultado)
// Se��o de Comandos 
fimalgoritmo
