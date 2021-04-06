import 'package:flutter/material.dart';
import 'components/MyAppBar.dart';
import 'package:game_debt/screens/user.dart';
import 'package:flutter/material.dart';

import 'screens/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: SignInScreen(),
    );
  }
}