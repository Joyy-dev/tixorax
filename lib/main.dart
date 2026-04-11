import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixora/firebase_options.dart';
import 'package:tixora/provider/events.dart';
import 'package:tixora/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            EventProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'TixoraX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF0D061E),
          scaffoldBackgroundColor: Color(0xFF0D061E),
          splashColor: Color(0xFFD5BDED),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0D061E),
            elevation: 0,
            foregroundColor: Color(0xFF9070E0),
            titleTextStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9070E0),
              letterSpacing: -0.5,
              fontSize: 26
            ),
          ),
          bottomAppBarTheme: BottomAppBarThemeData(
            color: Color(0xFF0D061E),
            elevation: 0,

          )
        ),
        home: const SplashScreen(),
      ),
    );
  }
}