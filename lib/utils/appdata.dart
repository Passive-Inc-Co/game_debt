import 'package:firebase_auth/firebase_auth.dart';

class AppData {
  static final AppData _appData = new AppData._internal();

  User? user;
  factory AppData() {
    return _appData;
  }
  AppData._internal();
}
final appData = AppData();