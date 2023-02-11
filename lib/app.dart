import 'package:flutter/material.dart';
import 'package:nectar/screens/splash_screen.dart';

class NectarApp extends StatelessWidget {
  const NectarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}