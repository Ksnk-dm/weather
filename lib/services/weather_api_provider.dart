import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherProvider {
  Future<Weather> getWeather() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?appid=0c2d6189e0ec193fc49c5fffd923c75c&q=kyiv&units=metric&lang=ua');
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> weatherMap = json.decode(response.body);
      final Weather weatherJson = Weather.fromJson(weatherMap);
      return weatherJson;
    } else {
      throw Exception('error load');
    }
  }
}
