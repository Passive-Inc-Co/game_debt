import 'package:flutter/material.dart';
import'CircleAvatar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final AppBar? appBar;

  const MyAppBar({Key? key, this.title,this.appBar })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Make it sliver appbar in the future
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      actions: <Widget> [MyAvatar()],
      title: Text(title!),
      backgroundColor: Colors.blueGrey,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar!.preferredSize.height);
}

