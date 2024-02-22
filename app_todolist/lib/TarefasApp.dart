import 'package:app_todolist/TarefasController.dart';
import 'package:app_todolist/TarefasScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TarefasController(),
        child: TarefasScreen(),
      ),
    );
  }
}
