import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  WeatherModel getCurrentWeather() {
    var weatherdata = dio.get(
      'https://api.weatherapi.com/v1/forecast.json?key=ed6eef55ff2843dfa03144846240701&q=cairo&days=1',
    );
    return WeatherModel.fromJson(weatherdata);
  }
}
