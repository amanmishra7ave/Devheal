import 'package:flutter/material.dart';
import 'package:programmer_health/Screens/goals_screen.dart';
import 'package:programmer_health/Screens/home_screen.dart';
import 'package:programmer_health/Screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/profile',
      routes: {
        '/':(context)=>HomeScreen(),
        '/goals':(context)=>GoalTrackingScreen(),
        '/profile':(context)=>ProfileScreen(),
      },
      // home: HomeScreen()
    );
  }
}
