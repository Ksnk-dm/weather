import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/bloc/weather_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () {
            print('click');
            weatherBloc.add(WeatherLoadEvent());
          },
          icon: Icon(Icons.update),
          color: Colors.green,
        ),
        IconButton(
          onPressed: () {
            weatherBloc.add(WeatherClearEvent());
          },
          icon: Icon(Icons.clear),
          color: Colors.red,
        )
      ],
    );
  }
}
