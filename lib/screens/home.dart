import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: weatherModel == null ? NoWitherBody() : WeatherInfoBody(),
    );
  }
}
