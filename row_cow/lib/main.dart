import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Layout")),
        body: Container(
          child: Row(children:[
             SizedBox(height: 20), 
            Column(children: [Text('FILME  ')], ),
             SizedBox(width: 20), 
            Column(children: [Icon( Icons.star)], ),
             SizedBox(width: 20), 
            Column(children: [Image.network(
            'https://imgs.search.brave.com/T0VtWFYnq8tNIHTAYq86dBOmsK-GKxWKyCzDTkQ7mpw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vd3d3LmJl/eW9uZHNhdGlyZS5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MjMvMDIvY2VudHJh/bC1tYXAtbWFya2Vk/LWNvbXAud2VicD9y/ZXNpemU9MTMzNSwx/MDgw', // Substitua a URL pela URL da sua imagem
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
          ),], ),
          
          ]),
        ),
      ),
    );
  }
}
