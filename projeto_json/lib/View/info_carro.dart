import 'dart:io';

import 'package:flutter/material.dart';

import '../Model/carros_model.dart';
import '../Controller/carros_controller.dart';

class CarroInfoPage extends StatelessWidget {
  Carro info;
  CarroInfoPage({required this.info});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livro Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
                info.foto!= null 
              ? Image.file(File(info.foto!), height: 200, width: 200,)
              : Placeholder(fallbackHeight: 200, fallbackWidth: 200),
            Text(info.placa),
            Text(info.modelo),
            Text(info.marca),
            Text("${info.ano}"),
            Text(info.cor),
            Text(info.descricao),
            Text("${info.valor}"),
          ],
        )),
      ),
    );
  }
}
