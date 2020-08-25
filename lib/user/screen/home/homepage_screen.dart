import 'package:flutter/material.dart';
import 'package:turbocharm/providers/car_provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import '../../widgets/trending_scroll_single.dart';
import '../../widgets/part_item.dart';
import 'package:provider/provider.dart';

class ScreenArguments {
  final String brandName;
  final String carName;
  ScreenArguments(this.brandName, this.carName);
}

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final ScreenArguments car = ModalRoute.of(context).settings.arguments;
    final carId = Provider.of<CarProvider>(context, listen: false)
        .findByName(car.carName, car.brandName)
        .id;
    var partList =
        Provider.of<PartProvider>(context, listen: false).getParts(carId);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: mediaQuery.size.height * 0.055),
          Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Text(
                "TRENDING",
                style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              RawMaterialButton(
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.white10)),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on,
                        color: Theme.of(context).accentColor),
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: 8, horizontal: mediaQuery.size.width * .04),
              itemBuilder: (context, index) => TrendingScrollSingle(),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 30),
          Consumer<CarProvider>(
            builder: (context, value, child) => Container(
              height: mediaQuery.size.height * 0.3,
              width: mediaQuery.size.width * 0.9,
              child: Image.network(
                value.items
                    .firstWhere((element) => element.id == carId)
                    .imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${car.brandName} ${car.carName}',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              "PARTS AVAILABLE   (" + partList.length.toString() + ")",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => PartItem(
              partList[index],
              carId,
            ),
            itemCount: partList.length,
          ),
        ],
      ),
    );
  }
}
