import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = 'http://api.weatherapi.com/v1';
  final String apiKey = 'f04b160549974145b83210911232611';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String country}) async {
    try {
      Response response =
          await dio.get('$baseURL/forecast.json?key=$apiKey&q=$country&days=1&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there is an error,try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there is an error");
    }
  }

  Future<WeatherModel> getForcast({required String country}) async {
    Response response =
        await dio.get('$baseURL/forecast.json?key=$apiKey&q=$country&days=1');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);

    return weatherModel;
  }
}
