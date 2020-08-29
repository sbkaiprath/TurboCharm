import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/models/car.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import 'package:turbocharm/shop/services/item_detail.dart';
import 'package:turbocharm/shop/services/edit_item.dart';

class AllItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var partList =
        Provider.of<PartProvider>(context, listen: false).available();

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
        onPressed: () {
          Navigator.of(context).pushNamed(EditItem.routeName);
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

class ServiceItem extends StatefulWidget {
  final String partId;
  final Car car;
  final String partname;
  final double partPrice;
  final String partImageUrl;
  final bool isAvailable;

  ServiceItem({
    @required this.car,
    this.partImageUrl,
    @required this.partPrice,
    @required this.partname,
    @required this.partId,
    @required this.isAvailable,
  });

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  @override
  Widget build(BuildContext context) {
    bool isAvailable = widget.isAvailable;
    var partList = Provider.of<PartProvider>(context, listen: false);
    return FlatButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamed(ItemDetail.routeName, arguments: widget.partId);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.25,
                color: Theme.of(context).cardColor,
                child: widget.partImageUrl != null
                    ? Image.network(
                        widget.partImageUrl,
                        fit: BoxFit.fill,
                      )
                    : Image(
                        image: AssetImage("assets/images/no_image.jpg"),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.57,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.partname,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.car.carName,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "₹ ${widget.partPrice.toString()} /-",
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
                          value: isAvailable,
                          onChanged: (value) {
                            partList.modifyPartsAvailability(widget.partId);
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
      ),
    );
  }
}
