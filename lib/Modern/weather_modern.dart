import 'package:flutter/foundation.dart';

class WeatherModern {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondtion;

  WeatherModern(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherCondtion});
  //
  factory WeatherModern.fromJson(json) {
    return WeatherModern(
        cityName: json['location']['name'],
        date: DateTime.parse(
          json['current']['last_updated'],
        ),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondtion: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
