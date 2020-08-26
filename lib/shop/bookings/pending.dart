import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/models/parts.dart';
import 'package:turbocharm/providers/order_provider.dart';
import 'package:turbocharm/providers/user_provider.dart';
import 'package:turbocharm/shop/bookings/book_info.dart';

class Pending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orderList = Provider.of<OrderProvider>(context, listen: false).pendingOrders;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (BuildContext context, int i) {
          return NewBooking(
            id: orderList[i].id,
            user: orderList[i].user,
            isFirst: orderList[i].isFirst,
            parts: orderList[i].parts,
            dateTime: orderList[i].dateTime,
            total: orderList[i].total,
          );
        },
      ),
    );
  }
}

class NewBooking extends StatelessWidget {
  final String id;
  final User user;
  final bool isFirst;
  final List<Parts> parts;
  final DateTime dateTime;
  final double total;

  NewBooking({
    @required this.id,
    @required this.user,
    this.isFirst = true,
    @required this.parts,
    @required this.dateTime,
    @required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).cardColor,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "New booking from ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              Text(
                user.name.toString(),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (isFirst)
            Text(
              "1st Time ",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
          BookInfo(
            parts: parts,
            dateTime: dateTime,
            total: total,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Reject",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: null,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).accentColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Accept",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
