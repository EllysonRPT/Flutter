import 'package:flutter/material.dart';
import 'package:projeto_api_geo/View/home_screen.dart';

import 'View/details_weather_screen.dart';
import 'View/search_screen.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(title: 'Home Page',
    theme: ThemeData(primarySwatch: Colors.amber),
    home: HomeScreen() ,
    debugShowCheckedModeBanner: false,
 routes:{
        '/search':(context) => const SearchScreen(),
      });
  }
}
