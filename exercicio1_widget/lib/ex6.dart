import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Example'),
      ),
      body: Center(
        child: Text('Main Content'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Lógica para lidar com a seleção do Item 1
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Lógica para lidar com a seleção do Item 2
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {
                // Lógica para lidar com a seleção do Item 3
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
