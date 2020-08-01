import 'package:flutter/material.dart';
import 'package:turbocharm/section.dart';
<<<<<<< HEAD
import './user/screen/login_screen.dart';
import './user/screen/select_car_screen.dart';
import './user/widgets/bottom_navigation.dart';
=======
import 'package:turbocharm/shop/shop_login_screen.dart';
>>>>>>> 2d7f0e3acb04b68147cf4a7f8d1db9224372ed1a

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turbo Charm',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(19, 19, 20, 1),
        accentColor: Color.fromRGBO(29, 181, 29, 1),
        primaryColorLight: Color.fromRGBO(25, 25, 27, 1),
        backgroundColor: Color.fromRGBO(19, 19, 20, 1),
        secondaryHeaderColor: Colors.white,
        buttonColor: Color.fromRGBO(29, 181, 29, 1),
        cardColor: Color.fromRGBO(29, 181, 29, 1),
        canvasColor: Color.fromRGBO(19, 19, 20, 1),
        indicatorColor: Colors.white70,
        fontFamily: "IBMPlexSans",
        textTheme: TextTheme(
          subtitle1: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 21,
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 17,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 16,
          ),
        ),
      ),
      home: Section(),
      routes: {
        Section.routeName: (ctx) => Section(),
<<<<<<< HEAD
        UserLoginScreen.routeName: (ctx) => UserLoginScreen(),
        SelectCarScreen.routeName: (ctx) => SelectCarScreen(),
        BottomDownBar.routeName: (ctx) => BottomDownBar()
=======
        ShopLoginScreen.routeName: (ctx) => ShopLoginScreen(),
>>>>>>> 2d7f0e3acb04b68147cf4a7f8d1db9224372ed1a
      },
    );
  }
}
