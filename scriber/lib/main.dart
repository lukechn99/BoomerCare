import 'package:flutter/material.dart';
import 'package:scriber/pages/home.dart';
// import 'package:scriber/pages/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Scriber',
    initialRoute: '/home',
    routes: {                  // map different routes around app
      // '/': (context) => LoginScreen(),
      '/home': (context) => MyHomePage(),
      // '/newUser': (context) => setUp(),
    },
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      // visual density adapt to platform
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
