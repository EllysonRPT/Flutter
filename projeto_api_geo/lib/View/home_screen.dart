import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../Service/wheater_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> _weatherData = {};
  WeatherService _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    _weatherData = new Map<String, dynamic>();
    _getWeatherInit();
  }

  Future<void> _fetchWeatherData(String city) async {
    try {
      final weatherData = await _weatherService.getWheather(city);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getWeatherInit() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final weatherData = await _weatherService.getWeatherByLocation(
          position.latitude, position.longitude);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsao Tempo'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Adicione a função para lidar com a busca aqui
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _getWeatherInit();
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _weatherData.isEmpty
                ? Row(
                    children: [
                      Text("erro de conexao"),
                      IconButton(icon: Icon(Icons.refresh), onPressed: () {})
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        _weatherData['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        _weatherData['weather'][0]['description'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        _weatherData['main']['temp'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        _weatherData['main']['temp_min'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        _weatherData['main']['temp_max'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        _weatherData['main']['humidity'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        _weatherData['main']['pressure'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
          ],
          // Seu conteúdo da tela aqui
        ),
      ),
    );
  }
}
