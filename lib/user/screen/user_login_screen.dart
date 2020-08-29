import 'package:flutter/material.dart';
import '../widgets/google_button.dart';

class UserLoginScreen extends StatelessWidget {
  static const routeName = '/user_login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/black_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 50),
              Transform.translate(
                offset: Offset(0, 30),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54,
                  ),
                ),
              ),
              SizedBox(height: 60),
              GoogleButton(),
              SizedBox(height: 13),
              Text(
                "By tapping Continue a user linked agreements and then must click the \"Agree and Continue\" box which further makes it clear to the user that an agreement is taking place.",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ));
  }
}