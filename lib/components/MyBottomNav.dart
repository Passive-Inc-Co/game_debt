import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_debt/screens/profile_screen/profile_screen.dart';
import 'package:game_debt/screens/home_screen/home_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState? selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon( Icons.email_outlined,
                    color: MenuState.message == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,),
                onPressed: () {}
              ),

              IconButton(
                icon: Image.asset( 'assets/poker-chips.png',
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,),
                onPressed: () =>  Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: Icon( Icons.account_circle_outlined,
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,),
                onPressed: () =>Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}