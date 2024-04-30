import 'package:flutter/material.dart';

import '../Model/livro_model.dart';

class LivroInfoPage extends StatelessWidget {
  Livro info;
   LivroInfoPage({required  this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livro'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(info.titulo),
            Text(info.autor),
            Text(info.sinopse),
            Text(info.categoria),
            Text("${info.isbn}")
          ],
        ),
      ),
    );
  }
}
