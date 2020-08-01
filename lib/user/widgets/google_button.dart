import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    return RawMaterialButton(
      elevation: 4,
      fillColor: Theme.of(context).accentColor,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.location_searching),
          SizedBox(
            width: 8,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1,
              children: <TextSpan>[
                TextSpan(text: 'Continue with '),
                TextSpan(
                    text: 'Google',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      shape: StadiumBorder(),
      onPressed: () {
        setState(() {
          timeDilation = 1.0;
        });
        Navigator.pushReplacementNamed(context, SelectCarScreen.routeName);
      },
    );
  }
}
