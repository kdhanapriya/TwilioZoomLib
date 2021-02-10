import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:twiliozoomlib/repository/repository.dart';
import 'package:twiliozoomlib/repository/twilio_api_provider.dart';
import 'package:twiliozoomlib/repository/zoom_api_privider.dart';
import 'package:twiliozoomlib/screen/home_screen.dart';

import 'bloc/twilio/twilio_cubit.dart';
import 'bloc/zoom/zoom_cubit.dart';

void main() {
  _setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Package sample',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

void _setUp() {
  print("Inside setup");
  GetIt.I.registerSingleton<ZoomApiProvider>(ZoomApiProvider());
  GetIt.I.registerSingleton<TwilioApiProvider>(TwilioApiProvider());

  GetIt.I.registerSingleton<Repository>(Repository());

  GetIt.I.registerSingleton<ZoomCubit>(ZoomCubit());
  GetIt.I.registerSingleton<TwilioCubit>(TwilioCubit());
}
