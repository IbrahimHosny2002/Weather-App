import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/view/screen/home.dart';

class Countery extends StatelessWidget {
  const Countery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const Home();
              }));
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter city name',
                labelText: 'Search',
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
