import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:twiliozoompkg_example/bloc/twilio/twilio_cubit.dart';
import 'package:twiliozoompkg_example/bloc/zoom/zoom_cubit.dart';
import 'package:twiliozoompkg_example/repository/repository.dart';
import 'package:twiliozoompkg_example/repository/twilio_api_provider.dart';
import 'package:twiliozoompkg_example/repository/zoom_api_privider.dart';

import 'package:twiliozoompkg_example/screen/home_screen.dart';

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
