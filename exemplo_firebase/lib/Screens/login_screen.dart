import 'package:exemplo_firebase/Screens/todolist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';
import 'home_screen.dart';

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
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {},
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) {},
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _acessarTodoList();
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<User?> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful'),
        ),
      );
      return await _auth.loginUsuario(
        _emailController.text,
        _passwordController.text,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Failed'),
        ),
      );
    }
  }

  //acessarTodoList
  Future<User?> _acessarTodoList() async {
    User? user = await _loginUser(); //user vazio
    if (user != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TodolistScreen(user: user)));
      // return await _auth.acessarTodoList(
      //   _emailController.text,
      //   _passwordController.text,
      // );
    } else {}
  }
}
