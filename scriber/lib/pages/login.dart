import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

// dummy code - user info stored in backend?
const users = const {
  'ivy@gmail.com': 'hd2020',
  'luke@gmail.com': 'chen',
  'akhil@gmail.com': 'mango',
  'jeff@gmail.com': 'uzbek',
  'thao@gmail.com': 'csci',
};

class LoginScreen extends StatelessWidget {
  // from example code of flutter_login
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> email(LoginData data) {
    print('Email: ${data.email}, Password: $(data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.email)) {
        return 'User does not exist';
      } else if (users[data.name] != data.password) {
        return 'Incorrect password';
      }
      return null
    });
  }

  Future<String> _recoverPassword(String email) {
    print('Email: $email');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(email)) {
        return 'Email not found';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Scriber',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}