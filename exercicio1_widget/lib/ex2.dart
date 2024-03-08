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
          title: Text('Exemplo de Interface'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organização Horizontal',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
              size: 50.0,
              color: Colors.blue,
            ),
            Text(
              'Casa',
              style: TextStyle(fontSize: 18.0),
            ),
            Image.network(
              'img/foto1.jpg',
              width: 50.0,
              height: 50.0,
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Text(
          'Organização Vertical',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        
        SizedBox(height: 10.0),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.school,
                  size: 50.0,
                  color: Colors.green,
                ),
                Text(
                  'Escola',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.work,
                  size: 50.0,
                  color: Colors.orange,
                ),
                Text(
                  'Trabalho',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
