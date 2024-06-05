import 'package:flutter/material.dart';
import 'View/lista_livros_view.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalogo de Livro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LivrosPage()
    );
  }
}
