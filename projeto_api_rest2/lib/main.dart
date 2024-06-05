import 'package:flutter/material.dart';
import 'package:projeto_api_rest2/Screen/cadastrar_produto_screen.dart';
import 'package:projeto_api_rest2/Screen/listar_produtos_screen.dart';

import 'Screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Api_Json',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/cadastrar': (context) => CadastrarProdutoScreen(),
        '/listar': (context) => ListarProdutosScreen(),
      },
    );
  }
}
