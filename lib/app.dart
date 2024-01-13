import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:price_scrapper/screen/home.dart';

class PriceScrapper extends StatelessWidget {
  const PriceScrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Color.fromRGBO(10, 89, 203,1),
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(
              fontSize: 14,
              letterSpacing: 0.5,
            ),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
