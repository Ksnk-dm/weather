import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_event.dart';
import 'package:weather/bloc/weather_state.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherEmptyState()) {
    on<WeatherLoadEvent>((event, emit) async{
      emit(WeatherLoadingState());
      print('load');

      try {
        final Weather loadedWeather = await weatherRepository.getWeather();
        emit(WeatherLoadedState(loadedWeather: loadedWeather));
      } catch (e) {
        print(e);
        emit(WeatherErrorState());
      }
    });
  }

  // @override
  // Stream<WeatherState> onEvent(WeatherEvent event) async* {
  //   super.onEvent(event);
  //   print('yy'+event.toString());
  //   if (event is WeatherEvent) {
  //     yield* _mapFetchWeatherToState(event);
  //   } else if (event is WeatherClearEvent) {
  //     yield WeatherEmptyState();
  //   }
  // }
  //
  // Stream<WeatherState> _mapFetchWeatherToState(WeatherEvent event) async* {
  //   yield WeatherLoadingState();
  //   try {
  //     final Weather loadedWeather = await weatherRepository.getWeather();
  //     print(loadedWeather);
  //     yield WeatherLoadedState(loadedWeather: loadedWeather);
  //   } catch (_) {
  //     print('loadedWeather');
  //     yield WeatherErrorState();
  //   }
  // }
}
