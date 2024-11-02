import 'package:weather_apps/Modern/weather_modern.dart';

class WeatherSate {}

class WeatherInitialState extends WeatherSate {}

class WeatherLoadedState extends WeatherSate {}

class WeatherFailarState extends WeatherSate {
  final String errorMessage;

  WeatherFailarState(this.errorMessage);
}
