import 'package:exemplo_firebase/Screens/home_screen.dart';
import 'package:exemplo_firebase/Screens/login_screen.dart';
import 'package:exemplo_firebase/Screens/register_screen.dart';
import 'package:exemplo_firebase/Screens/todolist_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false ,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        // '/todolist': (context) => const TodolistScreen()
      },
    );
  }
}
