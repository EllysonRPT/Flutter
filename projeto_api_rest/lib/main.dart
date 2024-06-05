import 'package:flutter/material.dart';
import 'View/home_screen.dart';
import 'View/lista_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/lista': (context) => ListaScreen(),
      },
    );
  }
}
