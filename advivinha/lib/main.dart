import 'dart:ffi';

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
  int _contadorTentativas = 0;
  int _numeroAleatorio = Random().nextInt(4) + 1;

  bool acertou = false;
  String _resultado = '';

  void _calcular() {
    int numero1 = int.tryParse(_controllerNumero1.text) ?? 0;

    setState(() {
      if (_numeroAleatorio != numero1) {
        String quase;

        if (numero1 > _numeroAleatorio) {
          quase =
              "TENTE UM NÚMERO MAIS BAIXO \n TENTATIVAS:$_contadorTentativas";
        } else {
          quase =
              "TENTE UM NÚMERO MAIS ALTO \n TENTATIVAS:$_contadorTentativas";
        }
        _resultado = "ERROU! $quase";
        _contadorTentativas++;
      } else {
        _resultado =
            "Parabéns, você acertou em $_contadorTentativas tentativas!";
        _contadorTentativas = 0;
        _numeroAleatorio = numero1;
      }
      // Limpa o texto do campo de texto após a verificação
      _controllerNumero1.clear();
    });
  }

  void _visibility() {
    setState(() {});
  }

  void _jogarNovamente() {
    setState(() {
      _numeroAleatorio = Random().nextInt(4) + 1;
      _resultado = '';
      acertou = false;
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
              onPressed: _calcular, // Chama a função _calcular
              child: Text('Tentar'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _jogarNovamente, // Chama a função _jogarNovamente
              child: Text('Jogar Novamente'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
