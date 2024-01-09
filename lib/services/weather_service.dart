import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response = await dio.get(
      'https://api.weatherapi.com/v1/forecast.json?key=ed6eef55ff2843dfa03144846240701&q=$cityName&days=1',
    );
    return WeatherModel.fromJson(response.data);
  }
}
