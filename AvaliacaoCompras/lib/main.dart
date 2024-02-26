import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TarefasController.dart';
import 'TarefasScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TarefasController(),
      child: MaterialApp(
        title: 'Lista de Compras',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TarefasScreen(),
      ),
    );
  }
}
