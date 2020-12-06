import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

// dummy code - user info stored using Firebase?
const users = const {
  'ivy@gmail.com': 'hd2020',
  'luke@gmail.com': 'chen',
  'akhil@gmail.com': 'mango',
  'jeff@gmail.com': 'uzbek',
  'thao@gmail.com': 'csci',
};

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin();
  }
}
