import 'package:weather/models/weather.dart';
import 'package:weather/services/weather_api_provider.dart';

class WeatherRepository {
 WeatherProvider _weatherProvider = WeatherProvider();
 Future<Weather> getWeather() => _weatherProvider.getWeather();
}