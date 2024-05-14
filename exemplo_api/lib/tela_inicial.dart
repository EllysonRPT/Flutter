import 'package:flutter/material.dart';
import 'servico.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService(
    apiKey: 'b9ebe666087f299f5e2aad3a03d093b6',
    baseUrl: 'https://api.openweathermap.org/data/2.5',
  );

  Map<String, dynamic> _weatherData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String cityName = '';
                    return AlertDialog(
                      title: Text('Enter City'),
                      content: TextField(
                        onChanged: (value) {
                          cityName = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter City',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (cityName.isNotEmpty) {
                              _fetchWeatherData(cityName);
                            }
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Enter City'),
            ),
            SizedBox(height: 20),
            if (_weatherData.isEmpty)
              CircularProgressIndicator()
            else
              Column(
                children: [
                  Text('City: ${_weatherData['name']}'),
                  Text('Temperature: ${(_weatherData['main']['temp'] - 273.15).toStringAsFixed(2)} °C'),
                  Text('Description: ${_weatherData['weather'][0]['description']}'),
                ],
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchWeatherData(String city) async {
    try {
      final weatherData = await _weatherService.getWheather(city);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }
}
