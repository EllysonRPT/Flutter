import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        //dois botôes listar e cadstrar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastrar');
              },
              child: const Text('Cadastrar'),
            ),
          SizedBox(height: 12,),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listar');
              },
              child: const Text('Listar'),
            ),
          SizedBox(height: 12,),

          ],
        ),
      ),
    );
  }
}