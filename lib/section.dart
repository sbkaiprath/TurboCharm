import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turbocharm/shop/shop_login_screen.dart';

class Section extends StatelessWidget {
  static const routeName = 'section';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .965,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 130),
                Text(
                  "TurboCharm",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(height: 90),
                FlatButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Theme.of(context).primaryColorLight,
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
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ShopLoginScreen.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Theme.of(context).primaryColorLight,
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
                SizedBox(height: 90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
