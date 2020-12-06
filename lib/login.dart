import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:scriber/main.dart';

// dummy code - user info stored using Firebase?
const users = const {
  'ivy@gmail.com': 'hd2020',
  'luke@gmail.com': 'chen',
  'akhil@gmail.com': 'mango',
  'jeff@gmail.com': 'uzbek',
  'thao@gmail.com': 'csci',
};

class LoginScreen extends FlutterLogin {
  // from flutter_login GitHub example
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Scriber',
      onLogin: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LandingScreen()),
        );
      },
    );
  }
}
