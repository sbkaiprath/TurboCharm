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
    double total = double.parse(((charge + gst) * 0.18).toStringAsFixed(2));

    return cartData.items.isEmpty
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Center(
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
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  contentPadding: EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(32)),
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                            top: 60,
                                            bottom: 16,
                                            left: 16,
                                            right: 16,
                                          ),
                                          margin: EdgeInsets.only(top: 50),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.transparent,
                                                offset: const Offset(0.0, 5.0),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                "Order Placed",
                                                style: TextStyle(
                                                    fontSize: 28.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(
                                                color: Colors.grey,
                                                height: 5,
                                              ),
                                              SizedBox(height: 16.0),
                                              Text(
                                                "Your order has been successfully\n placed",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(height: 24.0),
                                              InkWell(
                                                  splashColor: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                  onTap: () {
                                                    setState(() {
                                                      cartData.clearCart();
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(12),
                                                    width: double.infinity,
                                                    child: Text(
                                                      "OK",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 20),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          right: 16,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.check,
                                              color:
                                                  Theme.of(context).accentColor,
                                              size: 50,
                                            ),
                                            radius: 50,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                      },
                      child: Text('PROCEED NOW'),
                      textColor: Colors.white,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
