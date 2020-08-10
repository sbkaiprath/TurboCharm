import 'package:flutter/material.dart';
import '../widgets/trending_scroll_single.dart';
import '../widgets/part_item.dart';
import 'package:provider/provider.dart';
import '../providers/parts_providers.dart';
import '../providers/car_provider.dart';

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
        .findId(car.carName, car.brandName)
        .id;
    var partList =
        Provider.of<PartProvider>(context, listen: false).getParts(carId);
    return Column(
      children: <Widget>[
        SizedBox(
          height: mediaQuery.size.height * 0.07,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "Trending",
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            RawMaterialButton(
              padding: EdgeInsets.all(13),
              shape: StadiumBorder(side: BorderSide(color: Colors.white38)),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                        color: Theme.of(context).indicatorColor, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (context, index) => TrendingScrollSingle(),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 0,
          color: Colors.white60,
          thickness: 0.5,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${car.brandName} ${car.carName}',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        Container(
          height: mediaQuery.size.height * 0.30,
          width: double.infinity,
        ),
        Text("Parts Available",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400)),
        SizedBox(
          height: 10,
        )
        /* Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: 
           TextField(
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Theme.of(context).indicatorColor,
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: "Search Parts Services here",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
        )*/
        ,
        Container(
          height: MediaQuery.of(context).size.height * 0.116,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => PartItem(partList[index]),
            itemCount: partList.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
