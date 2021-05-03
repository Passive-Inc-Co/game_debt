import 'single_log.dart';
import 'package:flutter/material.dart';

class GameLog {
  final DateTime startTime = DateTime.now();
  final List<SingleLog> logs = [];
  var isActive = true;
  DateTime? endTime;

  void addLog(int amount) {
    this.logs.add(SingleLog(amount: amount));
  }

  void switchActivaition() {
    this.isActive = !this.isActive;
  }

  void removeLog(UniqueKey idToRemove) {
    this.logs.removeWhere((log) => log.id == idToRemove);
  }

  num sumMoney() {
    var sum = 0.0;
    this.logs.forEach((log) {
      sum += log.amount ??= 0;
    });
    return sum;
    //  TODO use the currency of the user
  }

  void finishGame() {
    this.endTime = DateTime.now();
    // TODO save all the game to DB
  }
}

GameLog demoGameLog() {
  GameLog demoLog = GameLog();
  demoLog.addLog(-300);
  demoLog.addLog(200);
  return demoLog;
}
GameLog demoUnAciveGameLog() {
  GameLog demoLog = GameLog();
  demoLog.addLog(-300);
  demoLog.addLog(200);
  demoLog.switchActivaition();
  return demoLog;
}