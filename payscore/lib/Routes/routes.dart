import 'package:flutter/material.dart';
import 'package:payscore/Screens/login.dart';
import 'package:payscore/Screens/register.dart';
import 'package:payscore/Screens/splashscreen.dart';
import 'package:payscore/Screens/verifyemail.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const SplashScreen(),
  '/Login': (BuildContext context) => const Login(),
  '/Register': (BuildContext context) => const RegistrationScreen(),
  '/VerifyEmail': (BuildContext context) => const VerifyEmail(),
};


//Navigation example Navigator.pushNamed(context, '/profile');
