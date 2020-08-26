import 'package:flutter/material.dart';

class Charges extends StatelessWidget {
  const Charges({
    Key key,
    @required this.charge,
    @required this.gst,
    @required this.total,
  }) : super(key: key);

  final double charge;
  final double gst;
  final double total;

  @override
  Widget build(BuildContext context) {
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
                  Text('₹ ' + charge.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text("GST", style: TextStyle(color: Colors.white)),
                  Text('₹ ' + gst.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text("TOTAL", style: TextStyle(color: Colors.white)),
                  Text('₹ ' + total.toString(),
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
                          "₹ $total",
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
              onPressed: () {},
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
