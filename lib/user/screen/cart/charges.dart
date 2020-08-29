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
        Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                setState(() {
                  cartData.clearCart();
                });
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(32)),
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 60,
                                    bottom: 16,
                                    left: 16,
                                    right: 16,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(32),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.transparent,
                                        offset: const Offset(0.0, 5.0),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "Order Placed",
                                        style: TextStyle(
                                            fontSize: 28.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        height: 5,
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        "Your order has been successfully\n placed",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 24.0),
                                      InkWell(
                                          splashColor: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            width: double.infinity,
                                            child: Text(
                                              "OK",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(32)),
                                          ))
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 16,
                                  right: 16,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.check,
                                      color: Theme.of(context).accentColor,
                                      size: 50,
                                    ),
                                    radius: 50,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ));
              },
              child: Text('PROCEED NOW'),
              textColor: Colors.white,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
