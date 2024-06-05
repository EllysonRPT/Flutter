import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices _auth = AuthServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child:Text('Login') ),
            ]
            )
            )
            )
            )
            )
  }
 Future <User?> _loginUser() async {
   { if (_formKey.currentState.validate()) {
    try{ 
      return _auth.loginUsuario(
        _emailController.text,
        _passwordController.text,
      );}catch(e){
print(e);
      }
    }
  }
}
}