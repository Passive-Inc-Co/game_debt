import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../sign_in.dart';
import '../../utils/authentication.dart';
import '../../components/MyAppBar.dart';
import '../../components/MyBottomNav.dart';
import '../../enums.dart';
import 'package:game_debt/utils/appdata.dart';
import 'package:currency_picker/currency_picker.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile_screen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? _user = appData.user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = this._user;
    super.initState();
  }

  Widget show() {
    if (this._user == null) {
      return Column(
        children: [Text('asa')],
      );
    } else {
      return (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          _user!.photoURL != null
              ? ClipOval(
                  child: Material(
                    color: Colors.blueGrey.withOpacity(0.3),
                    child: Image.network(
                      _user!.photoURL!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : ClipOval(
                  child: Material(
                    color: Colors.blueGrey.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 16.0),
          Text(
            'Hello',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            _user!.displayName!,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '( ${_user!.email!} )',
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            'You are now signed in using your Google account. To sign out of your account click the "Sign Out" button below.',
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 14,
                letterSpacing: 0.2),
          ),
          SizedBox(height: 16.0),
          _isSigningOut
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.redAccent,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await Authentication.signOut(context: context);
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context)
                        .pushReplacement(_routeToSignInScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('App Currency:'),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    showCurrencyPicker(
                      context: context,
                      showFlag: true,
                      showCurrencyName: true,
                      showCurrencyCode: true,

                      onSelect: (Currency currency) {
                       appData.currency=currency;
                       this.setState(() {});
                      },
                      currencyFilter: <String>['EUR', 'GBP', 'USD', 'AUD', 'CAD', 'JPY', 'HKD', 'CHF', 'SEK', 'ILS'],
                    );
                  },
                  child: Text(appData.currency.symbol))
            ],
          )
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
      appBar: MyAppBar(title: 'Game Debt', appBar: AppBar()),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: show()),
      ),
    );
  }
}
