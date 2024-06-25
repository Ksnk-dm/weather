import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherProvider {
  Future<Weather> getWeather() async {
    var url = Uri.parse(
        'https://stores-api.zakaz.ua/stores/48201070/products/search/?q=4820017000543&per_page=10');
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
