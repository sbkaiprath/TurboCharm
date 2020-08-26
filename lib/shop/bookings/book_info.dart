import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turbocharm/models/parts.dart';
import 'package:turbocharm/shop/services/item_detail.dart';

class BookInfo extends StatelessWidget {
  final List<Parts> parts;
  final DateTime dateTime;
  final double total;

  BookInfo({
    @required this.parts,
    @required this.dateTime,
    @required this.total,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).accentColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).cardColor,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat('MMM d, EEEE yyyy  ')
                .add_jm()
                .format(dateTime)
                .toString(),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: parts
                .map((e) => Item(
                      itemName: e.partname,
                      itemPrice: e.partPrice,
                      imageUrl: e.partImageUrl,
                      itemId: e.id,
                    ))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Charge : ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "₹ $total",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "GST :",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "₹ ${total * .18}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Total ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              Text(
                " ₹ ${(total * 1.18)}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String itemId;
  final String itemName;
  final double itemPrice;
  final String imageUrl;

  const Item({
    this.itemId,
    this.itemName,
    this.itemPrice,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamed(ItemDetail.routeName, arguments: itemId);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: imageUrl != null
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                          )
                        : Image(
                            image: AssetImage("assets/images/no_image.jpg"),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.topLeft,
                        child: Flexible(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "₹ $itemPrice",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
