import 'package:flutter/material.dart';
import 'package:turbocharm/shop/services/all_items.dart';
import 'package:turbocharm/shop/services/not_available.dart';

class Services extends StatelessWidget {
  static const routeName = 'services';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Services",
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
                child: Text("ALL ITEMS"),
              ),
              Tab(
                child: Text("NOT AVAILABLE"),
              ),
            ],
            // ),
          ),
        ),
        body: TabBarView(
          children: [
            AllItems(),
            NotAvailable(),
          ],
        ),
      ),
    );
  }
}
