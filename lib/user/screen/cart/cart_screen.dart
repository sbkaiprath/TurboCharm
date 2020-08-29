import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/cart_provider.dart';
import 'package:turbocharm/user/screen/cart/cart_list.dart';
import 'package:turbocharm/user/screen/cart/cart_company_info.dart';
import 'package:turbocharm/user/screen/cart/charges.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/company_provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    var companyItemProvider = Provider.of<CompanyItems>(context, listen: false);
    CartItem firstCartItem = cartData.items.isEmpty
        ? null
        : cartData.items.entries.elementAt(0).value;
    String firstPartId =
        cartData.items.isEmpty ? null : cartData.items.entries.elementAt(0).key;
    CompanyItem company = cartData.items.isEmpty
        ? null
        : companyItemProvider.getCompanyItem(
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
              children: [
                CartCompanyInfo(company: company),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.2,
                  color: Theme.of(context).accentColor,
                ),
                CartList(
                    cartData: cartData,
                    companyItemProvider: companyItemProvider),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Charges(charge, gst, total, cartData),
              ],
            ),
          );
  }
}
