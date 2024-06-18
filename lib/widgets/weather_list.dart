import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/bloc/weather_state.dart';

class WeatherList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        print(state);
        if (state is WeatherEmptyState) {
          return Center(child: Text('empty'));
        }
        if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is WeatherLoadedState) {
          return Container(
            child: Center(child: Text('${state.loadedWeather.name} temp: ${state.loadedWeather.main.temp}'))


            // ListView.builder(
            //     itemCount: 25,
            //     itemBuilder: (context, index) => ListTile(
            //           leading: Text('id :${state.loadedWeather.name}',
            //               style: TextStyle(fontWeight: FontWeight.bold)),
            //           title: Column(
            //             children: <Widget>[
            //               Text('my name'),
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: <Widget>[Text('title'), Text('data')],
            //               )
            //             ],
            //           ),
            //         )),
          );
        }
        return  Center(child: Text('Unexpected state: $state'));
      },
    );
  }
}
