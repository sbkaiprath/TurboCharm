import 'package:flutter/material.dart';
import 'package:turbocharm/providers/cart_provider.dart';
import 'package:turbocharm/providers/company_provider.dart';
import 'package:turbocharm/user/screen/home/part_shop.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key key,
    @required this.cartData,
    @required this.companyItemProvider,
  }) : super(key: key);

  final Cart cartData;
  final CompanyItems companyItemProvider;

  @override
  Widget build(BuildContext context) {
    var list = cartData.items.entries.toList();
    return Column(
      children: list.map((e) {
        String partId = e.key;
        CartItem cartItem = e.value;
        String carId = cartItem.carId;
        String companyId = cartItem.companyId;
        CompanyItem companyItem =
            companyItemProvider.getCompanyItem(companyId, carId, partId);
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(PartShop.routeName, arguments: {
              'partItem': partId,
              'carId': carId,
              'companyId': companyItem.companyId,
            });
          },
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  child: Image.network(
                    companyItem.parts.partImageUrl,
                    fit: BoxFit.fill,
                  ),
                  height: 80,
                  width: 90,
                ),
                title: Text(
                  companyItem.parts.partname,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  companyItem.parts.car.brand +
                      ' ' +
                      companyItem.parts.car.carName +
                      '\n' +
                      companyItem.companyName +
                      ' | ' +
                      companyItem.location.locationName,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                subtitle: Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'QTY    \t' +
                          cartItem.quantity.toString() +
                          '\nPRICE  \t ₹ ' +
                          cartItem.price.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  '₹ ' + (cartItem.price * cartItem.quantity).toString(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 0.2,
                color: Theme.of(context).accentColor,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
