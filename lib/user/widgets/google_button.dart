import 'package:flutter/material.dart';
import 'package:turbocharm/services/auth.dart';
import '../screen/select_car_screen.dart';

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
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Theme.of(context).accentColor, width: 2)),
      margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      child: InkWell(
        onTap: () async {
          bool res = await AuthService().signInWithGoogle();
          if (!res) {
            print('error login with google');
            return;
          }
          Navigator.pushReplacementNamed(context, SelectCarScreen.routeName);
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  topLeft: Radius.circular(7),
                  bottomRight: Radius.circular(4),
                  topRight: Radius.circular(4)),
              child: Image.asset(
                'assets/images/google.png',
                height: 48.0,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Continue with Google',
              softWrap: true,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
