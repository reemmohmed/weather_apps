import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/Modern/weather_modern.dart';
import 'package:weather_apps/cubits/get_waether_cubit/get_weather_cubit.dart';
import 'package:weather_apps/main.dart';

class weatherInfoBody extends StatelessWidget {
  const weatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModern weatherModern =
        BlocProvider.of<GetWeatherCubit>(context).weatherModern!;

    return Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getThemeColor(weatherModern.weatherCondtion)[200]!,
          getThemeColor(weatherModern.weatherCondtion)[50]!
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModern.cityName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              "Updated at :${weatherModern.date.hour}: ${weatherModern.date.minute}\n day is :${weatherModern.date.day}: ${weatherModern.date.month}:${weatherModern.date.year}",
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.network("https:${weatherModern.image}"),
                ),
                const SizedBox(
                  width: 88,
                ),
                Text(
                  weatherModern.temp.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22),
                ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp:${weatherModern.maxtemp.round()}",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "MinTemp:${weatherModern.mintemp.round()} ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              weatherModern.weatherCondtion,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
