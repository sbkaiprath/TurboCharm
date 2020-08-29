import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turbocharm/user/user_wrapper.dart';
import './shop/shop_login_screen.dart';

class Section extends StatelessWidget {
  static const routeName = '/section';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                // colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
              ),
              SizedBox(height: 50),
              Transform.translate(
                offset: Offset(-50, 0),
                child: Text(
                  "Welcome to\nTurbo Log",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54,
                  ),
                ),
              ),
              SizedBox(height: 1),
              RaisedButton(
                onPressed: () {
                  print("user wrapper");
                  return Navigator.of(context).pushNamed(UserWrapper.routeName);
                },
                color: Color.fromRGBO(19, 19, 20, 1),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.6,
                  alignment: Alignment.center,
                  child: Text(
                    "USER",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).buttonColor,
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ShopLoginScreen.routeName);
                },
                color: Color.fromRGBO(19, 19, 20, 1),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.6,
                  alignment: Alignment.center,
                  child: Text(
                    "SHOP",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).buttonColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white60, fontSize: 11),
                    children: <TextSpan>[
                      TextSpan(text: 'Designed by '),
                      TextSpan(
                          text: 'SentientPi',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
