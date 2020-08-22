import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/cart_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/company_provider.dart';
import '../../providers/car_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    final companyData =
        Provider.of<ModificationCompany>(context, listen: false);
    final carData = Provider.of<CarProvider>(context, listen: false);

    return cartData.items.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.remove_shopping_cart,
                size: 30,
                color: Colors.white,
              ),
              Text(
                'Sorry the Cart is Empty',
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
              )
            ],
          )
        : Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                leading: Container(
                  child: Image.network(
                    'https://www.smergers.com/media/businessphoto/46804-1592977306-8024aa83-c9e8-41d9-864b-7df2468653be.png',
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).accentColor)),
                  height: 80,
                  width: 90,
                ),
                title: Text(
                  companyData.getCompanyNme(
                      cartData.items.values.toList()[0].companyId),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${companyData.items.firstWhere((element) => element.companyId == cartData.items.values.toList()[0].companyId).location.locationName} | ${carData.items.firstWhere((element) => element.id == cartData.items.values.toList()[0].carId).carName}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
  }
}
