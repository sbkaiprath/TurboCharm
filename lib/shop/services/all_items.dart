import 'package:flutter/material.dart';

class AllItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          ServiceItem(),
          ServiceItem(),
          ServiceItem(),
          ServiceItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: null,
        label: Text(
          "ADD SERVICE",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        icon: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class ServiceItem extends StatefulWidget {
  const ServiceItem({
    Key key,
  }) : super(key: key);

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.3,
            color: Theme.of(context).cardColor,
            child: Image(
              image: AssetImage("assets/images/car_background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Black Seat Cover ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "All Vehicles",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    IconButton(icon: Icon(Icons.edit), onPressed: null),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Rs 3500.0/-",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    Transform.scale(
                      scale: .8,
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
