import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Carro_Cadastro_Screen extends StatefulWidget {
  const Carro_Cadastro_Screen({super.key});

  @override
  State<Carro_Cadastro_Screen> createState() => _Carro_Cadastro_ScreenState();
}

class _Carro_Cadastro_ScreenState extends State<Carro_Cadastro_Screen> {
  TextEditingController _placaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Carro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Cadastro de Carro"),
              TextFormField(
                controller: _placaController,
                decoration: InputDecoration(
                  hintText: "Digite a Placa",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value!.trim().isNotEmpty)
                    return "Placa Obrigatório";
                  else {
                    return null;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
