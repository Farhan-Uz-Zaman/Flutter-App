import 'package:flat/auth.dart';
import 'package:flat/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flat/home.dart';
import 'package:provider/provider.dart';
import 'users.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
      ),
      home: StreamProvider<User>.value(
        value: AuthService().user,
          child: Wrapper()),
    );
  }
}
