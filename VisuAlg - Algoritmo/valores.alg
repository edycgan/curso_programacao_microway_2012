algoritmo "valores"
// Fun��o :
// Autor :
// Data : 11/8/2012
// Se��o de Declara��es 
var
valor1, valor2, valor3, valor_menor : inteiro
resposta : caracter
inicio
repita
      limpatela
      
      escreva ("Digite 3 valores: ")
      leia (valor1, valor2, valor3)
      
      se (valor1 < valor2) E (valor1 < valor3) entao
         valor_menor <- valor2
      senao
           se(valor2 < valor1) E (valor2 < valor3) entao
               valor_menor <- valor2
           senao
                valor_menor <- valor3
           fimse
      fimse
               
      escreval ("O menor valor � o", valor_menor)
      escreval ("Deseja fazer outro teste?")
      escreval ("Pressione 'Enter' para continuar ou digite a palavra 'n�o' para encerrar.")
      leia (resposta)
ate (resposta = "n�o")
// Se��o de Comandos 
fimalgoritmo
