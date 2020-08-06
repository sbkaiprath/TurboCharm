import 'package:flutter/material.dart';

class PartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.055,
          backgroundColor: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
