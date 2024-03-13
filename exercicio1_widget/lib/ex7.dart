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
          title: Text('Widget Stack'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 500,
                top: 100,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
               left: 525,
                top: 125,
                child: Container(
                  color: Colors.green,
                  width: 150,
                  height: 150,
                ),
              ),
              Positioned(
               left: 550,
                top: 150,
                child: Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
