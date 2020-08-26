import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import 'package:turbocharm/shop/services/all_items.dart';
import 'package:turbocharm/shop/services/edit_item.dart';


class NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var partList = Provider.of<PartProvider>(context, listen: false).notAvailable();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int i) {
          return ServiceItem(
            partId: partList[i].id,
            car: partList[i].car,
            partname: partList[i].partname,
            partPrice: partList[i].partPrice,
            partImageUrl: partList[i].partImageUrl,
            isAvailable: partList[i].isAvailable,
          );
        },
        itemCount: partList.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: (){
          Navigator.of(context).pushNamed(EditItem.routeName );
        },
        label: Text(
          "Add Service",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        icon: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
