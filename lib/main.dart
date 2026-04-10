import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tixora/firebase_options.dart';
import 'package:tixora/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
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
        scaffoldBackgroundColor: Color(0xFF0D061E),
        splashColor: Color(0xFFD5BDED),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0D061E),
          foregroundColor: Color(0xFF9070E0),
          titleTextStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9070E0),
            fontSize: 26
          ),
        )
      ),
      home: const SplashScreen(),
    );
  }
}