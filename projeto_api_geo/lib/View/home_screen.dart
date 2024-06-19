import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../Controller/wheather_controller.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    super.initState();
    _getWeatherInit();
  }

  Future<void> _getWeatherInit() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      await _controller.getWeatherbyLocation(position.latitude, position.longitude);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previsão do Tempo"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  child: const Text("Pesquisa"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FavoritesScreen()),
                    );
                  },
                  child: const Text("Favoritos"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _controller.weatherList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Erro de Conexão"),
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: () {
                              _getWeatherInit();
                            },
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _controller.weatherList.last.name,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _controller.weatherList.last.main,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _controller.weatherList.last.description,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${(_controller.weatherList.last.temp - 273).toStringAsFixed(2)} °C',
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            _getWeatherInit();
                          },
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
