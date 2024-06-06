import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class TodolistScreen extends StatefulWidget {
  final User user;
  const TodolistScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  final AuthServices _services = AuthServices() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
        ],
      ),
      body: Center(
        child: Text('Todo List'),
      ),
    );
  }
}
