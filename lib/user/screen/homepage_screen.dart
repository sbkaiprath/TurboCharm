import 'package:flutter/material.dart';
import 'package:turbocharm/providers/car_provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import '../widgets/trending_scroll_single.dart';
import '../widgets/part_item.dart';
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
        .findId(car.carName, car.brandName)
        .id;
    var partList =
        Provider.of<PartProvider>(context, listen: false).getParts(carId);
    return Column(
      children: <Widget>[
        SizedBox(
          height: mediaQuery.size.height * 0.055,
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
          height: 10,
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
        SizedBox(
          height: 20,
        ),
        Consumer<CarProvider>(
          builder: (context, value, child) => Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Theme.of(context).accentColor)),
                height: mediaQuery.size.height * 0.22,
                width: mediaQuery.size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    value.items
                        .firstWhere((element) => element.id == carId)
                        .imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: mediaQuery.size.height * 0.22,
                width: mediaQuery.size.width * 0.6,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(15)),
              )
            ],
          ),
        ),
        SizedBox(height: mediaQuery.size.height * 0.06),
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
          height: MediaQuery.of(context).size.height * 0.150,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => PartItem(partList[index], carId),
            itemCount: partList.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
