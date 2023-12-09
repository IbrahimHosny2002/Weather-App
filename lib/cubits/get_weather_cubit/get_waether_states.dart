import 'package:weather/model/weather_model.dart';

class WeatherState{}
class WeatherIntialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});

}
class WeatherFailureState extends WeatherState{
  final String errorMessage;
  WeatherFailureState({required this.errorMessage});
}