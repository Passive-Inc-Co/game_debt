import 'package:flutter/material.dart';
import '../../components/MyAppBar.dart';
import '../../components/MyBottomNav.dart';
import '../../enums.dart';
import 'game_container.dart';
import 'package:game_debt/models/game_log.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";


  const HomeScreen({Key? key})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<GameLog> games;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,),
      appBar: MyAppBar(title: 'Game Debt', appBar: AppBar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              GameContainer(demoGameLog()),
              GameContainer(demoUnAciveGameLog()),
            ],
          )
        ),
      ),
    );
  }
}