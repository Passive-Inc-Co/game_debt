import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final String imgUrl;
  const MyAvatar({Key? key ,required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 58,
        child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: CircleAvatar(
//TODO make it take users photo or letter
            backgroundImage: NetworkImage(
                this.imgUrl),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          padding: EdgeInsets.all(2),
          shape: CircleBorder(side:BorderSide.none ),
        ));
  }
}
