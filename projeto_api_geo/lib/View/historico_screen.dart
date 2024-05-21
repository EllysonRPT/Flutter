import 'package:flutter/material.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({Key? key}) : super(key: key);

  @override
  State<HistoricoScreen> createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsao Tempo'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Adicione a função para lidar com a busca aqui
            },
          ),
        ],
      ),
    );
  }
}
