import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/order_provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import 'package:turbocharm/shop/shop_login_screen.dart';

class Profile extends StatelessWidget {
  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    var partList =
        Provider.of<PartProvider>(context, listen: false).available();
    var orderList = Provider.of<OrderProvider>(context, listen: false).completedOrders;
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image(
                image: AssetImage("assets/images/car_background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        ListView(
          children: <Widget>[
            SizedBox(height: 200),
            ProfileInfo(),
            SizedBox(height: 30),
            FlatButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, ShopLoginScreen.routeName, (route) => true);
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: MediaQuery.of(context).size.width * .35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  // color: Theme.of(context).buttonColor,
                ),
                child: Text(
                  "LOGOUT ",
                  style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ProfileStat(
              services: partList.length,
              completed: orderList.length,
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Modification Company",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Kannur",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text("Always Open \n 8 AM - 8 PM"),
            FlatButton(
              onPressed: null,
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: MediaQuery.of(context).size.width * .35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).buttonColor,
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Bookings Open"),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final int services;
  final int completed;

  const ProfileStat({
    @required this.services,
    @required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Services",
                    style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    services.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).buttonColor,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Completed",
                    style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    completed.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).buttonColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
