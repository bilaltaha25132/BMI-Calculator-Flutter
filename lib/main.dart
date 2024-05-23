import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFD1135),
        hintColor: Colors.yellow,
        // Explicitly setting AppBar theme
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0C1135), // Try setting this explicitly
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Color(0xFF0C1135),
      ),
      home: InputPage(),
    );
  }
}
