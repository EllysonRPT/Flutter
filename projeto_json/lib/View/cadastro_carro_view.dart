import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Carro_Cadastro_Screen extends StatefulWidget {
  const Carro_Cadastro_Screen({super.key});

  @override
  State<Carro_Cadastro_Screen> createState() => _Carro_Cadastro_ScreenState();
}

class _Carro_Cadastro_ScreenState extends State<Carro_Cadastro_Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _placaController = TextEditingController();
  TextEditingController _modeloController = TextEditingController();
  TextEditingController _marcaController = TextEditingController();
  TextEditingController _anoController = TextEditingController();
  TextEditingController _corController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _valorController = TextEditingController();
  File? _imagemSelecionada;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Carro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key:_formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Cadastro de Carro"),
                TextFormField(
                  controller: _placaController,
                  decoration: InputDecoration(
                    labelText: 'Placa',
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
                ),
                TextFormField(
                  controller: _modeloController,
                  decoration: InputDecoration(
                    labelText: 'Modelo',
                    hintText: "Digite a Modelo",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.trim().isNotEmpty)
                      return "Modelo Obrigatório";
                    else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _marcaController,
                  decoration: InputDecoration(
                    labelText: 'marca',
                    hintText: "Digite a marca",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.trim().isNotEmpty)
                      return "marca Obrigatório";
                    else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _anoController,
                  decoration: InputDecoration(
                    labelText: 'ano',
                    hintText: "Digite a ano",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.trim().isNotEmpty)
                      return "ano Obrigatório";
                    else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _corController,
                  decoration: InputDecoration(
                    labelText: 'cor',
                    hintText: "Digite a cor",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.trim().isNotEmpty)
                      return "cor Obrigatório";
                    else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                    labelText: 'descricao',
                    hintText: "Digite a descricao",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.trim().isNotEmpty)
                      return "descricao Obrigatório";
                    else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    labelText: 'valor',
                    hintText: "Digite a valor",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.trim().isNotEmpty)
                      return "valor Obrigatório";
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                _imagemSelecionada != null
                    ? Image.file(
                        _imagemSelecionada!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
                ElevatedButton(
                  onPressed: _tirarFoto,
                  child: Text('Tirar Foto'),
                ),
                ElevatedButton(
                  onPressed: (){if (_formKey.currentState!.validate()) {
                    
                  }} ,
                  child: Text("cadastro de Carro"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagemSelecionada = File(pickedFile.path);
      });
    }
  }
  
  // void _cadastrarCarro() {
  //   final placa = _placaController.text;
  //   final modelo = double.tryParse(_modeloController.text) ?? 0.0;
  //   final marca = _marcaController.text;
  //   if (placa.isNotEmpty && modelo > 0 && marca.isNotEmpty) {
  //     setState(() {
  //       _produtoController.adicionarProduto(Carro(placa: placa, modelo: modelo, marca: marca));
  //       _produtoController.saveProdutos();
  //     });
  //     _placaController.clear();
  //     _modeloController.clear();
  //     _marcaController.clear();
  //   }
  // }

}
