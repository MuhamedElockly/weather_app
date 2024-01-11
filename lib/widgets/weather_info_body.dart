import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weathermodel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(weathermodel.weatherCondition),
              getThemeColor(weathermodel.weatherCondition)[300]!,
              getThemeColor(weathermodel.weatherCondition)[50]!,
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Updated at : ${weathermodel.date.hour} : ${weathermodel.date.minute}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:' + weathermodel.image.toString(),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/clear.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Text(
                  weathermodel.temp.round().toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Max : ' + weathermodel.maxTemp.round().toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Min : ' + weathermodel.minTemp.round().toString(),
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                )
              ],
            ),
            Text(
              weathermodel.weatherCondition,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
