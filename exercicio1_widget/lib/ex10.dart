import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _progressValue = 0.0;

  // Função simulada para atualizar o valor da barra de progresso
  void _updateProgress() {
    setState(() {
      if (_progressValue < 1.0) {
        _progressValue += 0.1;
      } else {
        _progressValue = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barra de Progresso Dinâmica'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _updateProgress,
                child: Text('Atualizar Progresso'),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                value: _progressValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
