import 'package:flutter/material.dart';
import 'package:scriber/scan.dart';
import 'package:scriber/speech.dart';
import 'package:scriber/login.dart';
import 'package:scriber/viewRecords.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingScreen(),
      // home: LoginScreen(),
    );
  }
}

class LandingScreen extends StatefulWidget {
  String title = "Landing Screen";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

/**
 * landing screen comes after login
 * if a user logs out, it should lead back
 * to the login page
 */
class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    ViewDocs(),
    ScanScreen(),
    SpeechScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scriber'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'My Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Scan in Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Listen in',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _children[_selectedIndex],
    );
  }
}

/**
 * Should other pages besides login and 
 */
