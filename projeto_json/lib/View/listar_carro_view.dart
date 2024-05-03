import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CarrosListarScreen extends StatefulWidget {
  const CarrosListarScreen({super.key});

  @override
  State<CarrosListarScreen> createState() => _CarrosListarScreenState();
}

class _CarrosListarScreenState extends State<CarrosListarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Carros"),),
    );
  }
}
