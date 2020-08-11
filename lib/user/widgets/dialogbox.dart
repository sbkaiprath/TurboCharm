import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/company_provider.dart';

class DialogBox extends StatelessWidget {
  final String id;
  final String carId;
  DialogBox(this.id, this.carId);
  @override
  Widget build(BuildContext context) {
    var itemList = Provider.of<ModificationCompany>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.grey,
            elevation: 7,
            child: ListTile(
              leading: Image.network(
                  itemList.getCompanies(id, carId)[index].parts.partImageUrl),
              title: Text(itemList.getCompanies(id, carId)[index].companyName),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: null),
            ),
          );
        },
        itemCount: itemList.getCompanies(id, carId).length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
