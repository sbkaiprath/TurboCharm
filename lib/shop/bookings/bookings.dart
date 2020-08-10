import 'package:flutter/material.dart';
import 'package:turbocharm/shop/bookings/accepted.dart';
import 'package:turbocharm/shop/bookings/pending.dart';
import 'package:turbocharm/shop/bookings/previous.dart';

class Bookings extends StatelessWidget {
  static const routeName = 'bookings';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Bookings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Modification Company",
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor:  Theme.of(context).accentColor,
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w800,
            ),
            tabs: [
              Tab(
                child: Text("PENDING"),
              ),
              Tab(
                child: Text("ACCEPTED"),
              ),
              Tab(
                child: Text("PREVIOUS"),
              ),
            ],
            // ),
          ),
        ),
        body: TabBarView(
          children: [
            Pending(),
            Accepted(),
            Previous(),
          ],
        ),
      ),
    );
  }
}
