import 'package:flutter/material.dart';

void main() {
// Variáveis mutáveis
var numero = 42;
print("Número inicial: $numero");

// Alterando o valor da variável
numero = 100;

print("Número alterado: $numero");

// Variável de tipo dinâmico
dynamic variavelDinamica = "Texto";
print("Variável dinâmica: $variavelDinamica");

// Alterando dinamicamente o tipo e valor
variavelDinamica = 42;
print("Variável dinâmica alterada: $variavelDinamica");
}