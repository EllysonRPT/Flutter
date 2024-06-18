import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
 //
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulário'),
        ),
        body: MyForm(),
      ),
    ); 
  }
}

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('EMAIL'),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Campo 1',
                border: OutlineInputBorder(),
                hintText: 'Digite algo',
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('SENHA'),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Campo 2',
                border: OutlineInputBorder(),
                hintText: 'Digite algo',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
