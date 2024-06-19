import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/services/weather_repository.dart';
import 'package:weather/widgets/bottom_app_bar_widget.dart';
import 'package:weather/widgets/sliding_panel.dart';
import 'package:weather/widgets/weather_list.dart';
import 'package:weather/widgets/weather_temp.dart';

import '../widgets/action_buttons.dart';

class HomePage extends StatelessWidget {
  final weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weatherRepository: weatherRepository),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF3E2D8F),
              Color(0xFF9D52AC),
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //ActionButtons(),
                    const WeatherTemp(),
                    WeatherList()
                  ],
                ),
                SlidingPanel()
              ],
            )),
      ),
    );
  }
}
