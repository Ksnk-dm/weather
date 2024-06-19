import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/services/weather_repository.dart';
import 'package:weather/widgets/bottom_app_bar_widget.dart';
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
            gradient: LinearGradient(colors: [
          Color(0xFF2E335A),
          Color(0xFF45278B),
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
                SlidingUpPanel(
                  color: const Color(0xFF2E335A),
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  collapsed: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Flexible(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Today",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Flexible(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "yule 19",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  panel: const Center(
                    child: Text("This is the sliding Widget22"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
