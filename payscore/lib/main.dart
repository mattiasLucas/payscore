import 'package:flutter/material.dart';
import 'Routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
    );
  }
}
