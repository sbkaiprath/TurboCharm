import 'package:flutter/material.dart';
import '../../models/trending_models.dart';

class TrendingScrollSingle extends StatelessWidget {
  final TrendingModelItem item;
  TrendingScrollSingle(this.item);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Card(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    item.partImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                    ),
                    width: 300,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 22, top: 10, bottom: 10),
                      child: Text(
                        item.partname,
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            shadowColor: Colors.white24,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.35,
        ),
      ],
    );
  }
}
