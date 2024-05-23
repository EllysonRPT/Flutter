import '../Model/wheader_model.dart';
import '../Service/wheater_service.dart';

class WeatherController {
  // Atributos
  final WeatherService _service = WeatherService();
  final List<Weather> _weatherList = [];

  // Getter
  List<Weather> get weatherList => _weatherList;

  // Métodos
  Future<void> getWeather(String city) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWheather(city));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }

  // lon/lat
  Future<void> getWeatherbyLocation(double lat, double lon) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWeatherByLocation(lat, lon));
      _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> findCity(String city) async {
    try {
      Weather weather = Weather.fromJson(await _service.getWheather(city));
      _weatherList.add(weather);
      return true;
    } catch (e) {
      print(e);
      return false; 
    } 
  }
}
