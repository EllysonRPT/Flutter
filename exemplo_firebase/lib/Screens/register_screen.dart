
import 'package:exemplo_firebase/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthServices _service =  AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //form register screen
      body: Padding(padding: EdgeInsetsGeometry.all(8),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
                validator: (value) {}
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                validator: (value) {}
              ),
              TextFormField(
                controller: _confirmedPasswordController,
                decoration: InputDecoration(hintText: 'Confimed Password'),
                validator: (value) {}
                
              ),SizedBox(20),//Elevetead button
              ElevatedButton( onPressed: () {
                child: Text('Registrar')
              }

              )

              ]
              )
              )
              )

      ),
    );
  }
  Future<User> _RegistrarUser() async {
    if (_formKey.currentState.validate()) {
      if (_passwordController.text==_confirmedPasswordController.text) {
      return await _service.registerUsuario(
        _emailController.text,
         _passwordController.text);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('As senhas não conferem'),
            duration: Duration(seconds: 2),
          ),);
          _passwordController.clear();
          _confirmedPasswordController.clear();
      }
     
    }
    
  }
}