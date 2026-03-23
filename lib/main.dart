import 'package:flutter/material.dart';
import 'package:tixora/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TixoraX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF241338),
        scaffoldBackgroundColor: Color(0xFF241338),
        splashColor: Color(0xFFD5BDED),
      ),
      home: SplashScreen(),
    );
  }
}