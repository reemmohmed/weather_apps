import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_apps/Modern/weather_modern.dart';

class WeatherService {
  final Dio dio;
  final String basedUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '0fa3fed3c5834babb6275507242710';

  WeatherService({required this.dio});
  Future<WeatherModern> getcurentweather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$basedUrl/forecast.json?key=$apiKey&q=$cityName&days=10');
      WeatherModern weatherModern = WeatherModern.fromJson(response.data);
      return weatherModern;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error , thry later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , thry later');
    }
  }
}
