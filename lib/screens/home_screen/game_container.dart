import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_debt/models/game_log.dart';
import 'package:intl/intl.dart';

class GameContainer extends StatefulWidget {
  GameContainer(this.gameData);
  final GameLog gameData;

  @override
  _GameContainerState createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer> {

  final varNumberController = TextEditingController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void changeVarNum(text){
    this.setState(() {
      log(text);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget addSection(){
    return this.widget.gameData.isActive? (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Amount",
                isDense: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: varNumberController,
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.green,
            ),
            onPressed: () => (this.setState(() {
              this.widget.gameData.addLog(int.parse(varNumberController.text));
            }))),
        IconButton(
            icon: Icon(
              Icons.indeterminate_check_box_outlined,
              color: Colors.red,
            ),
            onPressed: () => (this.setState(() {
              this.widget.gameData.addLog(int.parse("-"+varNumberController.text));
            })))
      ],
    )):Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
        color: this.widget.gameData.isActive?Colors.blueGrey[150]:Colors.blueGrey[100],
        margin: const EdgeInsets.symmetric( vertical: 7),
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ExpansionTile(
              trailing: Text(
                this.widget.gameData.sumMoney().toString() + "\$",
                style: TextStyle(
                    color: this.widget.gameData.sumMoney() > 0
                        ? Colors.lightGreen
                        : Colors.red),
              ),
              title: Text(
                DateFormat('dd/MM/yy').format(this.widget.gameData.startTime),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('data'),
                )
              ],
            ),
            addSection()
          ],
        ),
      ),
    );
  }
}
