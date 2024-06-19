import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/widgets/card_widget.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

class SlidingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadedState) {
        return SlidingUpPanel(
          backdropEnabled: true,
          color: const Color(0xFF9D52AC),
          maxHeight: MediaQuery.of(context).size.height * 1,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          collapsed: const Center(
              child: Text("Today", style: TextStyle(color: Colors.white))),
          panel: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardWidget(cardName: '${state.loadedWeather.wind.speed}'),
                    CardWidget(cardName: 'card2'),
                    CardWidget(cardName: 'card3'),
                  ],
                ),
              ),
            ],
          ),
        );
      }
      return Center(child: Text('Unexpected state: $state'));
    });
  }
}
