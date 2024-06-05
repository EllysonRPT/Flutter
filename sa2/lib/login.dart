import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa2/controller.dart';
import 'package:sa2/model.dart';
import 'package:sa2/Cadastro_page.dart';

class LoginPage extends StatelessWidget {
  final dbHelper = BancoDadosCrud();
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de texto
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  // Add password validation here if necessary
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Chamar a função de validação de login
                    final List<ContatoModel> contatos = (await dbHelper.getContacts(
                      _emailController.text,
                      _senhaController.text,
                    )).cast<ContatoModel>();
                    
                    if (contatos.isNotEmpty) {
                      // Se o login for bem-sucedido, navegue para a página interna
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Interna()),
                      );
                    } else {
                      // Se o login falhar, exiba uma mensagem de erro
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Email ou senha inválidos.'),
                        ),
                      );
                    }
                  }
                },
                child: Text('Entrar'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastro_page()),
                  );
                },
                child: Text('Cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
