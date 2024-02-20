import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();

  String _resultado = '';

  void _calcular() {
    int numero1 = int.tryParse(_controllerNumero1.text) ?? 00;

    double resultado;

    setState(() {
      bool certo = false;
      Random rd = new Random();
      int numeroAleatorio = rd.nextInt(5);
      int cont = 0;
      while (certo) {
        if (numeroAleatorio != numero1) {
          _resultado = "ERROU,EU ACHO";
        } else {
          _resultado = "Duas palavras Para-Bens";
          certo = true;
        }
        cont++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => ('Somar'),
              child: Text('Somar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
