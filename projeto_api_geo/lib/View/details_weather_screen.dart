import 'package:flutter/material.dart';

import '../Controller/wheather_controller.dart';

class DetailsWeatherScreen extends StatefulWidget {
  final String city;
  const DetailsWeatherScreen({required this.city});

  @override
  State<DetailsWeatherScreen> createState() => _DetailsWeatherScreenState();
}

class _DetailsWeatherScreenState extends State<DetailsWeatherScreen> {
  final WeatherController _controller = WeatherController();
  Future<void>? _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    await _controller.getWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: FutureBuilder<void>(
            future: _weatherFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError || _controller.weatherList.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Connection Error", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _weatherFuture = _fetchWeather();
                        });
                      },
                      child: Text("Try Again"),
                    ),
                  ],
                );
              } else {
                final weather = _controller.weatherList.last;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weather.name,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 24,
                        ),
                      ],
                    ),
                    Text(
                      weather.main,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      weather.description,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      (weather.temp - 273.15).toStringAsFixed(2) + "°C",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
