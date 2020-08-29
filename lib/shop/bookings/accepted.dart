import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/models/order.dart';
import 'package:turbocharm/models/parts.dart';
import 'package:turbocharm/providers/order_provider.dart';
import 'package:turbocharm/providers/user_provider.dart';
import 'package:turbocharm/shop/bookings/book_info.dart';

class Accepted extends StatefulWidget {
  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  @override
  Widget build(BuildContext context) {
    var orderList =
        Provider.of<OrderProvider>(context, listen: false).acceptedOrders;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (BuildContext context, int i) {
          return AcceptedBooking(
            id: orderList[i].id,
            user: orderList[i].user,
            isFirst: orderList[i].isFirst,
            parts: orderList[i].parts,
            dateTime: orderList[i].dateTime,
            total: orderList[i].total,
            orderStatus: orderList[i].orderStatus,
          );
        },
      ),
    );
  }
}

class AcceptedBooking extends StatefulWidget {
  final String id;
  final User user;
  final bool isFirst;
  final List<Parts> parts;
  final DateTime dateTime;
  final double total;
  final OrderStatus orderStatus;

  AcceptedBooking({
    @required this.id,
    @required this.user,
    this.isFirst = true,
    @required this.parts,
    @required this.dateTime,
    @required this.total,
    @required this.orderStatus,
  });

  @override
  _AcceptedBookingState createState() => _AcceptedBookingState();
}

class _AcceptedBookingState extends State<AcceptedBooking> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
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
                widget.user.name.toString(),
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (widget.isFirst)
            Text(
              "1st Time ",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
          BookInfo(
            parts: widget.parts,
            dateTime: widget.dateTime,
            total: widget.total,
          ),
          FlatButton(
            onPressed: () => orderProvider.modifyOrderStatus(widget.id, OrderStatus.completed),
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
                "Done",
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
    );
  }
}

class Item extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final String imageUrl;
  const Item({
    this.itemName,
    this.itemPrice,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          image: AssetImage('assets/images/name_logo.png'),
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
    );
  }
}
