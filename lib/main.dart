import 'package:flutter/material.dart';
import 'screens/SplashScreen.dart';
import 'theme/app_theme.dart';


void main()
{
  runApp(const CalenderApp());
}

class CalenderApp extends StatelessWidget {
  const CalenderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calender',

      theme: MyTheme.them,

      home: const SplashScreen(),

    );
  }
}
