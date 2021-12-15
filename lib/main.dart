import 'package:command_pattern/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FirstMainScreen(),
      // home: const SecondMainScreen(),
      // home: const ThirddMainScreen(),
      // home: const FourthMainScreen(),
      home: const HomeScreen(),
    );
  }
}
