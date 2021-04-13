import 'package:flutter/material.dart';
import'CircleAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final AppBar? appBar;


  const MyAppBar({Key? key, this.title,this.appBar,});


  @override
  Widget build(BuildContext context) {
    //TODO Make it sliver appbar in the future
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      // actions: <Widget> [MyAvatar(imgUrl:this._user.photoURL?? "https://images.vexels.com/media/users/3/189299/isolated/preview/35bdc522366f66f364796411f595fec1-poker-cards-four-aces-illustration-by-vexels.png")],
      title: Text(title!),
      backgroundColor: Colors.blueGrey,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar!.preferredSize.height);
}

