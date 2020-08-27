import 'package:flutter/material.dart';

class TrendingScrollSingle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Card(
            shadowColor: Colors.white24,
            child: Text(
              "X",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: Theme.of(context).accentColor,
          ),
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.35,
        ),
      ],
    );
  }
}
