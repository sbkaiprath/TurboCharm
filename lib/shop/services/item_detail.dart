import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import 'package:turbocharm/shop/services/edit_item.dart';

class ItemDetail extends StatefulWidget {
  static const routeName = 'item-detail';

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Scaffold build(BuildContext context) {
    final itemId = ModalRoute.of(context).settings.arguments as String;
    final loadedItem =
        Provider.of<PartProvider>(context, listen: false).getPart(itemId);

    bool isAvailable = loadedItem.isAvailable;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditItem.routeName, arguments: itemId);
              }),
        ],
        centerTitle: true,
        title: Text(
          loadedItem.partname,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                height: 300,
                width: double.infinity,
                child: loadedItem.partImageUrl != null
                    ? Image.network(
                        loadedItem.partImageUrl,
                        fit: BoxFit.fill,
                      )
                    : Image(
                        image: AssetImage("assets/images/no_image.jpg"),
                        fit: BoxFit.fill,
                      ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${loadedItem.car.carName} ",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${loadedItem.car.brand} ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '₹ ${loadedItem.partPrice}',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    isAvailable ? "AVAILABLE" : "NOT AVAILABLE",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  Transform.scale(
                    scale: .8,
                    child: Switch(
                      value: isAvailable,
                      onChanged: (value) {
                        setState(() {
                          isAvailable = value;
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (loadedItem.description != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      loadedItem.description,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
