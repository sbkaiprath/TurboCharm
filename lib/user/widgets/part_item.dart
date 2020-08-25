import 'package:flutter/material.dart';
import '../../models/parts.dart';
import '../screen/home/part_options.dart';

class PartItem extends StatelessWidget {
  final Parts partItem;
  final String carId;
  PartItem(this.partItem, this.carId);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              PartOptions.routeName,
              arguments: {'partItem': partItem.id, 'carId': carId},
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Image(
                  image: NetworkImage(partItem.partImageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          partItem.partname,
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
