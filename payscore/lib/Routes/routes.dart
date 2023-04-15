import 'package:flutter/material.dart';
import 'package:payscore/Screens/home.dart';
import 'package:payscore/Screens/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const SplashScreen(),
  '/Home': (BuildContext context) => const Home(),
};


//Navigation example Navigator.pushNamed(context, '/profile');
