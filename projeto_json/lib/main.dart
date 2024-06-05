import 'package:flutter/material.dart';
import 'package:projeto_json/View/listar_carro_view.dart';

import 'View/cadastro_carro_view.dart';
import 'View/home_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Loja Carros",
      theme: ThemeData(primarySwatch: Colors.grey ),
      home: HomeScreenPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreenPage(),
        '/listar': (context) => CarrosListarScreen(),
        '/cadastrar': (context) => Carro_Cadastro_Screen(),
        // '/editar': (context) => CarrosEditarScreen(),
        // '/detalhes': (context) => CarrosDetalhesScreen(),
      },
    );
  }
}
