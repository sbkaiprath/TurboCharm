import 'package:flutter/material.dart';
import 'package:turbocharm/providers/car_provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import '../../widgets/trending_scroll_single.dart';
import 'part_item.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                color: Color.fromRGBO(230, 231, 232, 1), fontSize: 15),
            children: <TextSpan>[
              TextSpan(text: 'TURBO'),
              TextSpan(
                  text: 'LOG', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        actions: [
          RawMaterialButton(
            padding: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Theme.of(context).accentColor),
                Text(
                  "Location",
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: mediaQuery.size.height * 0.04),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "TRENDING",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(230, 231, 232, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Color.fromRGBO(230, 231, 232, 1),
                  indent: 18,
                  endIndent: 12,
                ))
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: mediaQuery.size.width * .02),
                itemBuilder: (context, index) => TrendingScrollSingle(),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Color.fromRGBO(230, 231, 232, 1),
              endIndent: 12,
              indent: 13,
            ),
            SizedBox(height: 30),
            Consumer<CarProvider>(
              builder: (context, value, child) => Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: mediaQuery.size.height * 0.3,
                width: mediaQuery.size.width * 0.9,
                child: ClipRRect(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                        value.items
                            .firstWhere((element) => element.id == carId)
                            .imageUrl,
                        fit: BoxFit.cover),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${car.brandName} ${car.carName}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30),
            DropItem(partList: partList, carId: carId)
          ],
        ),
      ),
    );
  }
}

class DropItem extends StatefulWidget {
  const DropItem({
    Key key,
    @required this.partList,
    @required this.carId,
  }) : super(key: key);

  final List partList;
  final String carId;

  @override
  _DropItemState createState() => _DropItemState();
}

class _DropItemState extends State<DropItem> {
  var _check = false;
  @override
  Widget build(BuildContext context) {
    return !_check
        ? Card(
            elevation: 3,
            shadowColor: Colors.grey,
            color: Theme.of(context).primaryColor,
            child: ListTile(
              leading: Text(
                widget.partList.length.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              title: Text('Parts Available',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              trailing: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _check = true;
                    });
                  }),
            ),
          )
        : Column(
            children: [
              Divider(
                color: Color.fromRGBO(230, 231, 232, 1),
                endIndent: 12,
                indent: 13,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      'PARTS AVAILABLE (${widget.partList.length.toString()})',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _check = false;
                          });
                        }),
                    SizedBox(
                      width: 17,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => PartItem(
                  widget.partList[index],
                  widget.carId,
                ),
                itemCount: widget.partList.length,
              ),
            ],
          );
  }
}
