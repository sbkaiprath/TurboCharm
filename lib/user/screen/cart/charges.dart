import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_provider.dart';

class Charges extends StatefulWidget {
  final double charge;
  final double gst;
  final double total;
  final Cart cartDta;
  Charges(this.charge, this.gst, this.total, this.cartDta);

  @override
  _ChargesState createState() => _ChargesState();
}

class _ChargesState extends State<Charges> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(
      context,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("CHARGE", style: TextStyle(color: Colors.white)),
                  Text('₹ ' + widget.charge.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text("GST", style: TextStyle(color: Colors.white)),
                  Text('₹ ' + widget.gst.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text("TOTAL", style: TextStyle(color: Colors.white)),
                  Text('₹ ' + widget.total.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Charge  "),
                        Text(
                          "₹ ${widget.total}",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text("Appx. Time 12 Hrs"),
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
                  color: Colors.black,
                ),
                FlatButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Schedule Date",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
