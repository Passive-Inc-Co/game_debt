import 'package:firebase_auth/firebase_auth.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:currency_picker/src/currencies.dart';

class AppData {
  static final AppData _appData = new AppData._internal();

  User? user;
  Currency currency=Currency.from(json: currencies[0]);
  factory AppData() {
    return _appData;
  }
  AppData._internal();
}
final appData = AppData();