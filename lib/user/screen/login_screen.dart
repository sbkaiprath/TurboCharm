import 'package:flutter/material.dart';

class UserLoginScreen extends StatelessWidget {
  static const routeName = '/user_login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/car_background.jpg",
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
