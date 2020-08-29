import 'package:flutter/material.dart';
import 'package:turbocharm/services/auth.dart';
import '../screen/select_car_screen.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

class GoogleButton extends StatefulWidget {
  const GoogleButton({
    Key key,
  }) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton.icon(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.white,
          onPressed: () async {
            bool res = await AuthService().signInWithGoogle();
            if (!res) {
              print('error login with google');
              return null;
            }
            Navigator.pushReplacementNamed(context, SelectCarScreen.routeName);
          },
          icon: Image.asset(
            'assets/images/google.png',
            height: 48.0,
          ),
          label: Text(
            'Continue with Google',
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * .7,
          child: CheckboxListTile(
              selected: true,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "Receive promotional mails\n from Auto Charm",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              activeColor: Theme.of(context).accentColor,
              value: timeDilation != 1.0,
              onChanged: (value) {
                setState(() {
                  timeDilation = value ? 3.0 : 1.0;
                });
              }),
        ),
      ],
    );
  }
}
