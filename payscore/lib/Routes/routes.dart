import 'package:flutter/material.dart';
import 'package:payscore/Screens/home.dart';
import 'package:payscore/Screens/login.dart';
import 'package:payscore/Screens/register.dart';
import 'package:payscore/Screens/resolveaccount.dart';
import 'package:payscore/Screens/splashscreen.dart';

import 'package:payscore/Screens/verifyemail.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const SplashScreen(),
  '/Home': (BuildContext context) => const Home(),
  '/Login': (BuildContext context) => const Login(),
  '/Register': (BuildContext context) => const RegistrationScreen(),
  '/VerifyEmail': (BuildContext context) => const VerifyEmail(),
  '/ResolveAccount': (BuildContext context) => ResolveAccount()
};


//Navigation example Navigator.pushNamed(context, '/profile');
