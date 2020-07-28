import 'package:flutter/material.dart';
import 'package:turbocharm/section.dart';
import './user/screen/login_screen.dart';
import './user/screen/select_car_screen.dart';

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
        UserLoginScreen.routeName: (ctx) => UserLoginScreen(),
        SelectCarScreen.routeName: (ctx) => SelectCarScreen()
      },
    );
  }
}
