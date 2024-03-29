import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetWeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Home',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return SearchView();
                    }),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherFailureState) {
                return NoWitherBody();
              } else if (state is WeatherSuccessState) {
                return WeatherInfoBody();
              } else {
                return Text('Ops, there was an error !');
              }
            },
          ),
        );
      },
    );
  }
}
