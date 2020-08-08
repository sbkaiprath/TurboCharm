import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/models/parts.dart';
import 'package:turbocharm/models/user.dart';
import 'package:turbocharm/providers/order_provider.dart';
import 'package:turbocharm/shop/bookings/book_info.dart';

class Previous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orderList = Provider.of<OrderProvider>(context, listen: false).completedOrders;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (BuildContext context, int i) {
          return Completed(
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

class Completed extends StatelessWidget {
  final String id;
  final User user;
  final bool isFirst;
  final List<Parts> parts;
  final DateTime dateTime;
  final double total;

  Completed({
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
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).cardColor,
      ),
      child: ExpansionTile(
        title: Text(
          user.name.toString(),
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              DateFormat('MMM d, EEEE y').format(dateTime).toString(),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
            Text(
              " ₹ $total",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: BookInfo(
              parts: parts,
              dateTime: dateTime,
              total: total,
            ),
          ),
        ],
        // ),
      ),
    );
  }
}
