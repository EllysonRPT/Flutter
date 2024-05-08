import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_json/Controller/carros_controller.dart';
import 'package:projeto_json/Model/carros_model.dart';

class Carro_Cadastro_Screen extends StatefulWidget {
  const Carro_Cadastro_Screen({super.key});

  @override
  State<Carro_Cadastro_Screen> createState() => _Carro_Cadastro_ScreenState();
}
  CarrosController _controller = new CarrosController();


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
            key: _formKey,
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
                    if (value!.trim().isEmpty)
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
                    if (value!.trim().isEmpty)
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
                    if (value!.trim().isEmpty)
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
                    if (value!.trim().isEmpty)
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
                    if (value!.trim().isEmpty)
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
                    if (value!.trim().isEmpty)
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
                    if (value!.trim().isEmpty)
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _cadastrarCarro();  
                    }
                  },
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

  Carro criarObjeto() {
    return Carro(
        placa: _placaController.text,
        modelo: _modeloController.text,
        marca: _marcaController.text,
        ano: int.parse(_anoController.text),
        cor: _corController.text,
        descricao: _descricaoController.text,
        foto: _imagemSelecionada!.path,
        valor: double.parse(_valorController.text));
  }


  void limparValores() {
    _placaController.clear();
    _modeloController.clear();
    _marcaController.clear();
    _anoController.clear();
    _corController.clear();
    _descricaoController.clear();
    _valorController.clear();
    _imagemSelecionada = null;
       setState(() {
      
    });
  }

  void _apagarCampos() {
    _placaController.text = "";
    _modeloController.text = "";
    _marcaController.text = "";
    _anoController.text = "";
    _corController.text = "";
    _descricaoController.text = "";
    _valorController.text = "";
    _imagemSelecionada = null;
     setState(() {
      
    });
  }

  void _cadastrarCarro() {
    //verificação
    _controller.addCarro(criarObjeto());
    _controller.saveCarrosToFile(); //
    limparValores();
    _apagarCampos();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Carro Cadastrado com Sucesso"),
      ),
    );
  }
}

