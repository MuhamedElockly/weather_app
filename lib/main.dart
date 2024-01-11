import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel?.weatherCondition,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  Map<String, Color> weatherColors = {
    'Sunny': Colors.yellow,
    'Partly cloudy': Colors.lightBlueAccent,
    'Cloudy': Colors.grey,
    'Overcast': Colors.blueGrey,
    'Mist': Colors.white70,
    'Rain': Colors.blue,
    'Thunderstorm': Colors.indigo,
    'Snow': Colors.white,
    'Fog': Colors.grey,
    'Drizzle': Colors.blueGrey,
    'Freezing drizzle': Colors.lightBlueAccent,
    'Ice pellets': Colors.lightBlue,
    'Blizzard': Colors.white,
    'Clear': Colors.black, // Added for consistency with night conditions
    'Patchy': Colors.lightBlue, // Added for general "patchy" conditions
  };

  // Check for exact matches first
  if (weatherColors.containsKey(condition)) {
    return weatherColors[condition] as MaterialColor; // Cast to MaterialColor
  }

  // Handle broader conditions and variations
  if (condition.contains('Sunny')) {
    return Colors.yellow as MaterialColor;
  } else if (condition.contains('Rain')) {
    return Colors.blue as MaterialColor;
  } else if (condition.contains('Snow')) {
    return Colors.lightBlue as MaterialColor;
  } else if (condition.contains('Cloudy')) {
    return Colors.grey as MaterialColor;
  } else if (condition.contains('Mist') || condition.contains('Fog')) {
    return Colors.white70 as MaterialColor;
  } else if (condition.contains('Thunderstorm')) {
    return Colors.indigo as MaterialColor;
  } else if (condition.contains('Drizzle')) {
    return Colors.blueGrey as MaterialColor;
  } else if (condition.contains('Freezing')) {
    return Colors.lightBlueAccent as MaterialColor;
  } else if (condition.contains('Blizzard')) {
    return Colors.white as MaterialColor;
  } else if (condition.contains('Patchy')) {
    return Colors.lightBlue as MaterialColor;
  } else {
    // Default color for any unmatched conditions
    return Colors.grey as MaterialColor;
  }
}
