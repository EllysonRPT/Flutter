import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conjunto de Botões'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Elevated Button'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // cor do texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // borda arredondada
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text('Text Button'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // borda arredondada
                  ),
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                child: Text('Outlined Button'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue, side: BorderSide(color: Colors.blue), // cor da borda
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // borda arredondada
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
