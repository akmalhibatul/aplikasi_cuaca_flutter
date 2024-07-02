import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  Weather? weather;

  Future<void> fetchWeather(String cityName) async {
    final apiKey = '7f38dcdc51780b4504e12db23503d000';
    final url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      weather = Weather.fromJson(data);
      notifyListeners();
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
