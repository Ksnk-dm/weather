import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';

class WeatherTemp extends StatelessWidget {
  const WeatherTemp({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of(context);
    weatherBloc.add(WeatherLoadEvent());
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadedState) {
        return Padding(
          padding: const EdgeInsets.all(90.0),
          child: Column(
            children: [
              Center(
                  child: Text(state.loadedWeather.name,
                      style: TextStyle(color: Colors.white, fontSize: 34))),
              Center(
                  child: Text('${state.loadedWeather.main.temp.toInt().toString()}°',
                      style: TextStyle(color: Colors.white, fontSize: 70))),
              Center(
                  child: Text(state.loadedWeather.weather[0].description,
                      style: TextStyle(color: Colors.grey, fontSize: 20))),
              Center(
                  child: Text('h:${state.loadedWeather.main.temp_max.toInt()}° l:${state.loadedWeather.main.temp_min.toInt()}°',
                      style: TextStyle(color: Colors.white, fontSize: 20)))
            ],
          ),
        );
      }
      return  Center(child: Text('Unexpected state: $state'));
    });
  }
}
