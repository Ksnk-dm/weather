
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/services/weather_repository.dart';
import 'package:weather/widgets/weather_list.dart';

import '../widgets/action_buttons.dart';

class HomePage extends StatelessWidget {
final weatherRepository = WeatherRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weatherRepository: weatherRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Weathers'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            WeatherList()
          ],
        ),
      ),
    );
  }
}