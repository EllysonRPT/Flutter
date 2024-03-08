import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Aplicação'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Ação ao clicar no ícone de pesquisa
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Ação ao clicar no ícone de notificações
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Conteúdo da Página Inicial'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navegar para a página inicial
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Navegar para a página de favoritos
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Navegar para a página do perfil do usuário
              },
            ),
          ],
        ),
      ),
    );
  }
}
