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
          title: Text('Carregar Imagem da URL'),
        ),
        body: Center(
          child: Image.network(
            'https://imgs.search.brave.com/sIBApsVixRvwGUNOpbOZggxFppnQoIgMpN7JaIFdoRs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90bS5p/YnhrLmNvbS5ici8y/MDIyLzAyLzIyLzIy/MDIwMTE2MTMyMDAw/LmpmaWY', // Substitua a URL pela URL da sua imagem
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
