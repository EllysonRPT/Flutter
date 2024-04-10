import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa2/Model.dart';
import 'package:sa2/controller.dart';
import 'package:sa2/login.dart';
import 'package:sa2/Model.dart';
// import 'package:sa2/login_page.dart';

class Cadastro_page extends StatefulWidget {
  const Cadastro_page({super.key});

  @override
  State<Cadastro_page> createState() => _Cadastro_pageState();
}

class _Cadastro_pageState extends State<Cadastro_page> {
  final dbHelper = BancoDadosCrud();
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de texto
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'senha'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an senha';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid ID (only digits allowed)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add email format validation here if necessary
                  return null;
                },
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
              TextFormField(
                controller: _enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addContact();
                    Navigator.pop(context); // Volta para a página anterior
                  }
                },
                child: Text('Cadastrar'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Ir para o Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para adicionar um novo contato ao banco de dados
   void _addContact() {
    final newContact = ContatoModel(
      senha: int.parse(_senhaController.text),
      nome: _nomeController.text,
      email: _emailController.text,
      telefone: _telefoneController.text,
      endereco: _enderecoController.text,
    );

      dbHelper.create(newContact);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cadastro realizado com sucesso!'),
      ),
    );
    setState(() {
      // Atualiza a lista de contatos
    });
  }
}

