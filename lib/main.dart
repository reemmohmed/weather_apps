import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/cubits/get_waether_cubit/get_weather_cubit.dart';
import 'package:weather_apps/cubits/get_waether_cubit/get_weather_state.dart';
import 'package:weather_apps/views/home_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        // كدا انا بست الداتا هلشان تتغير من غير ما بعمل hotrelode
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherSate>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.amber,
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModern
                          ?.weatherCondtion),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeViews(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  log("Condition: $condition");
  if (condition == null) {
    return Colors.blue;
  }
  condition = condition.trim().toLowerCase();
  switch (condition) {
    case 'sunny':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.blueGrey;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.lightBlue;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.blue;
    case 'patchy sleet possible':
      return Colors.indigo;
    case 'patchy freezing drizzle possible':
      return Colors.cyan;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.indigo;
    case 'blizzard':
      return Colors.indigo;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.cyan;
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
      return Colors.blue;
    case 'freezing drizzle':
      return Colors.cyan;
    case 'heavy freezing drizzle':
      return Colors.teal;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.blue;
    case 'moderate rain at times':
      return Colors.indigo;
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
      return Colors.blueGrey;
    case 'heavy rain':
      return Colors.blueGrey;
    case 'light freezing rain':
      return Colors.cyan;
    case 'moderate or heavy freezing rain':
      return Colors.teal;
    case 'light sleet':
      return Colors.lightBlue;
    case 'moderate or heavy sleet':
      return Colors.blue;
    case 'patchy light snow':
      return Colors.blue;
    case 'light snow':
      return Colors.blue;
    case 'patchy moderate snow':
      return Colors.indigo;
    case 'moderate snow':
      return Colors.indigo;
    case 'patchy heavy snow':
      return Colors.deepPurple;
    case 'heavy snow':
      return Colors.deepPurple;
    case 'ice pellets':
      return Colors.blueGrey;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
      return Colors.blue;
    case 'torrential rain shower':
      return Colors.blueGrey;
    case 'light sleet showers':
      return Colors.lightBlue;
    case 'moderate or heavy sleet showers':
      return Colors.blue;
    case 'light snow showers':
      return Colors.blue;
    case 'moderate or heavy snow showers':
      return Colors.indigo;
    case 'light showers of ice pellets':
      return Colors.blueGrey;
    case 'moderate or heavy showers of ice pellets':
      return Colors.blue;
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.purple;
    case 'patchy light snow with thunder':
      return Colors.indigo;
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey; // لون افتراضي للحالات غير المعروفة
  }
}
