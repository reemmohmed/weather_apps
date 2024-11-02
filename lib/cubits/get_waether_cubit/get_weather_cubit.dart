import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/Modern/weather_modern.dart';
import 'package:weather_apps/cubits/get_waether_cubit/get_weather_state.dart';
import 'package:weather_apps/services/weather_service.dart';

import '../../views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherSate> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModern? weatherModern;

  getWeather({required String cityName}) async {
    try {
      weatherModern =
          await WeatherService(dio: Dio()).getcurentweather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailarState(e.toString()));
    }
  }
}
