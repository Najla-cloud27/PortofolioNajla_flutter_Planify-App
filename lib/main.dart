import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PlanifyApp());
}

class PlanifyApp extends StatelessWidget {
  const PlanifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planify',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
