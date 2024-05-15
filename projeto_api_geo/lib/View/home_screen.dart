import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


  @override
  void initState() {
    super.initState();
    _weatherData = new Map<String, dynamic>();
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

  Future<void> _fetchWeatherLocation() async {
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
  
class _HomeScreenState extends State<HomeScreen> {
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
                ElevatedButton(
                  onPressed:(){},
                  child: const Text('Buscar'),
                )

              ],
            )
          ],
          // Seu conteúdo da tela aqui
        ),
      ),
    );
  }
}
