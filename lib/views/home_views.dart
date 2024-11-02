import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/cubits/get_waether_cubit/get_weather_cubit.dart';
import 'package:weather_apps/cubits/get_waether_cubit/get_weather_state.dart';
import 'package:weather_apps/views/search_view.dart';
import 'package:weather_apps/widgets/weather_info_body.dart';
import 'package:weather_apps/widgets/no_weather_body%20.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchView();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
          title: Text(
            "Weather Apps",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherSate>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return weatherInfoBody();
            } else {
              return Text("opp's therre was an error");
            }
          },
        ));
  }
}
