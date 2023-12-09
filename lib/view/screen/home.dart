import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_waether_states.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/view/screen/search_for_countery.dart';
import 'package:weather/view/widget/no_weather_body.dart';
import 'package:weather/view/widget/weather_body_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const Countery();
                  }));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherIntialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return  WeatherBodyInfo(weatherModel: state.weatherModel,);
            } else {
              return const Center(child: Text("OOPS There is an error"));
            }
          },
        ));
  }
}
