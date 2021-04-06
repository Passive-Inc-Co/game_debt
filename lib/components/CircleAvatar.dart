import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {


  const MyAvatar({Key? key })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 58,
        child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          child: CircleAvatar(
//TODO make it take users photo or letter
            backgroundImage: NetworkImage(
                "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
            backgroundColor: Theme.of(context).accentColor,
          ),
          padding: EdgeInsets.all(0),
          shape: CircleBorder(),
        ));
  }
}
