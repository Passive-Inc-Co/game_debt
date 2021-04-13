import 'package:flutter/widgets.dart';

import 'package:game_debt/screens/sign_in.dart';
import 'package:game_debt/screens/home_screen/home_screen.dart';

final Map<String,WidgetBuilder> routes={
  SignInScreen.routeName:(context) =>SignInScreen(),
  HomeScreen.routeName:(context) =>HomeScreen(),

};