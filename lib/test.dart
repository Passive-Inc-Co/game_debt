import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 58,
        child: PopupMenuButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
              backgroundColor: Colors.red,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: '1',
                  child: Text('1'),
                ),
                PopupMenuItem<String>(
                  value: '2',
                  child: Text('2'),
                )
              ];
            }));
  }
}
