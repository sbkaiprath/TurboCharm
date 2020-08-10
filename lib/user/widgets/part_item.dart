import 'package:flutter/material.dart';
import '../models/parts.dart';

class PartItem extends StatelessWidget {
  final Parts partItem;
  PartItem(this.partItem);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.058,
          backgroundColor: Theme.of(context).accentColor,
          child: CircleAvatar(
            child: Text(
              partItem.partname,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            radius: MediaQuery.of(context).size.height * 0.055,
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
