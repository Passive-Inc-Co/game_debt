import 'package:flutter/material.dart';

class SingleLog {
  num? amount;
  final UniqueKey id = UniqueKey();
  final DateTime date= DateTime.now();

  SingleLog({
    @required this.amount,
});

  void changeAmount(int newAmount){
    this.amount = newAmount;
  }
}