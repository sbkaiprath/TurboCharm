import 'package:flutter/material.dart';
import '../../models/parts.dart';
import './dialogbox.dart';

class PartItem extends StatelessWidget {
  final Parts partItem;
  final String carId;
  PartItem(this.partItem, this.carId);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.058,
              backgroundColor: Theme.of(context).accentColor,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text(
                          '${partItem.partname}',
                          textAlign: TextAlign.center,
                        ),
                        content: Builder(
                          builder: (context) {
                            var height = MediaQuery.of(context).size.height;
                            var width = MediaQuery.of(context).size.width;
                            return Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(color: Colors.white),
                                child: DialogBox(partItem.id, carId));
                          },
                        ),
                      ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(partItem.partImageUrl),
                  radius: MediaQuery.of(context).size.height * 0.055,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Text(
          partItem.partname,
          style: TextStyle(color: Theme.of(context).accentColor),
        )
      ],
    );
  }
}
