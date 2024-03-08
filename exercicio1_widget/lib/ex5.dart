import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Example'),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              BackButton(),
              ButtonBar(children: [Text("data")],)
            ]),
          ),
        ),
      ),
    );
  }
}
