import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// Importa o pacote de material Flutter
// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(MyApp());
}

// Definindo a classe MyApp que herda de StatelessWidget
class MyApp extends StatelessWidget {
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  Widget build(BuildContext context) {
// Retorna um MaterialApp, que é o widget raiz da aplicação Flutter
    return MaterialApp(
// Configura a tela inicial como um Scaffold
      home: Scaffold(
// Barra superior da tela (AppBar)
        appBar: AppBar(
// Título da barra superior
          title: Text('Exemplo de Árvore de Widgets'),
        ),
// Corpo da tela, composto por um Column (coluna vertical) de widgets
        body: Column(
          children: [
// Texto simples como primeiro filho da coluna
            Text('Nome: kruiser '),
            Text('idade: 30'),
            Text('Endereço: Broklin'),
            Text('telefone: 99999-99999'),
            Text('email: ell@gmail.com'),
// Container contendo um Row (linha horizontal) de dois Text widgets

            Container(
  child: Row(
    children: [
      Expanded(
        child: Column(
          children: [
            Text('Filho Aninhado 1'),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Text('Filho Aninhado 2'),
          ],
        ),
      ),
    ],
  ),
),

// Texto simples como segundo filho da coluna
            Text('Segundo Filho'),
          ],
        ),
      ),
    );
  }
}
