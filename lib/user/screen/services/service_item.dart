import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/service_provider.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Consumer<ServiceProviders>(
        builder: (context, value, child) => ListView.builder(
          padding: EdgeInsets.only(bottom: 15),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.network(
                            value.items[index].serviceImageUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 10,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(19)),
                            width: 300,
                            child: Text(
                              value.items[index].serviceName,
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white70),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(value.items[index].companyItem.location
                                    .locationName)
                              ],
                            ),
                            Text(
                              ' ₹ ${value.items[index].servicePrice}',
                              style: TextStyle(fontSize: 22),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
          itemCount: value.items.length,
        ),
      ),
    );
  }
}
