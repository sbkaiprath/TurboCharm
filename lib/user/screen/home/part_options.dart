import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import 'package:turbocharm/user/screen/home/part_shop.dart';
import '../../../providers/company_provider.dart';

class PartOptions extends StatelessWidget {
  static const routeName = '/part_options';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String partId = args['partItem'];
    final String carId = args['carId'];
    final loadedItem =
        Provider.of<PartProvider>(context, listen: false).getPart(partId);
    var itemList = Provider.of<CompanyItems>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
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
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => EachItem(
                    itemList.getCompanies(partId, carId)[index],
                    carId,
                    partId,
                  ),
                  itemCount: itemList.getCompanies(partId, carId).length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// EACH ITEM
class EachItem extends StatefulWidget {
  final CompanyItem companyItem;
  final String carId;
  final String partId;

  EachItem(
    this.companyItem,
    this.carId,
    this.partId,
  );

  @override
  _EachItemState createState() => _EachItemState();
}

class _EachItemState extends State<EachItem> {
  var result = 'No Items available';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).popAndPushNamed(PartShop.routeName, arguments: {
            'partItem': widget.partId,
            'carId': widget.carId,
            'companyId': widget.companyItem.companyId,
          });
        },
        contentPadding: EdgeInsets.all(8),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).accentColor,
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              widget.companyItem.parts.partImageUrl,
            ),
          ),
        ),
        title: Text(
          widget.companyItem.companyName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('\n${widget.companyItem.location.locationName}'),
            Text(
              '₹ ${widget.companyItem.parts.partPrice}',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
