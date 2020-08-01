import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './user/screen/login_screen.dart';

class Section extends StatelessWidget {
  static const routeName = '/section';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.infinity,
          child: Image.asset(
            "assets/images/car_background.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black38),
        ),
        ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .965,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 200),
                  Transform.translate(
                    offset: Offset(-50, 0),
                    child: Text(
                      "Welcome to\nAuto Charm",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, UserLoginScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: Colors.black)
                          ],
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.7,
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
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: Colors.black)
                          ],
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.7,
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
                  Spacer(),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.white60, fontSize: 11),
                      children: <TextSpan>[
                        TextSpan(text: 'Designed by '),
                        TextSpan(
                            text: 'SentientPi',
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
