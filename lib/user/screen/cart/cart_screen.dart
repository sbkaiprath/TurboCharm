import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/cart_provider.dart';
import 'package:turbocharm/user/screen/home/part_shop.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/company_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    CartItem firstCartItem = cartData.items.entries.elementAt(0).value;
    String firstPartId = cartData.items.entries.elementAt(0).key;
    var companyItemProvider = Provider.of<CompanyItems>(context, listen: false);
    CompanyItem company = companyItemProvider.getCompanyItem(
        firstCartItem.companyId, firstCartItem.carId, firstPartId);
    double charge = double.parse(cartData.getTotalCharge.toStringAsFixed(2));
    double gst = double.parse((charge * 0.18).toStringAsFixed(2));
    double total = charge + gst;

    return cartData.items.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'Sorry the Cart is Empty',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          )
        : Scaffold(
            body: ListView(
              shrinkWrap: true,
              children: [
                _cartCompany(company),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.2,
                  color: Theme.of(context).accentColor,
                ),
                _cartList(cartData, companyItemProvider),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                _charges(charge, gst, total),
              ],
            ),
          );
  }

  //COMPANY

  Column _cartCompany(CompanyItem company) {
    return Column(
                children: [
                  ListTile(
                    onTap: null,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        child: Image.network(
                          company.companyImage,
                          fit: BoxFit.fill,
                        ),
                        height: 80,
                        width: 90,
                      ),
                    ),
                    title: Text(
                      company.companyName.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      company.location.locationName +
                          ' | ' +
                          company.parts.car.brand +
                          ' ' +
                          company.parts.car.carName,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  )
                ],
              );
  }

//CART LIST

  ListView _cartList(Cart cartData, CompanyItems companyItemProvider) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String partId = cartData.items.entries.elementAt(index).key;
        CartItem cartItem = cartData.items.entries.elementAt(index).value;
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
      },
      itemCount: cartData.items.length,
    );
  }

  //CHARGES

  Padding _charges(double charge, double gst, double total) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("CHARGE", style: TextStyle(color: Colors.white)),
              Text('₹ ' + charge.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              Text("GST", style: TextStyle(color: Colors.white)),
              Text('₹ ' + gst.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              Text("TOTAL", style: TextStyle(color: Colors.white)),
              Text('₹ ' + total.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
