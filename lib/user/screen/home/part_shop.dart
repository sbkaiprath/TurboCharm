import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/cart_provider.dart';
import 'package:turbocharm/providers/company_provider.dart';
import '../../widgets/badge.dart';
import '../cart/cart_screen.dart';

class PartShop extends StatefulWidget {
  static const routeName = '/part_shop';

  @override
  _PartShopState createState() => _PartShopState();
}

class _PartShopState extends State<PartShop> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String carId = args['carId'];
    final String companyId = args['companyId'];
    final String partId = args['partItem'];
    var companyItem = Provider.of<CompanyItems>(context, listen: false)
        .getCompanyItem(companyId, carId, partId);
    final cartData = Provider.of<Cart>(context, listen: false);
    CartItem cartItem = cartData.items[partId];
    final bool isAvailable = true;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          companyItem.parts.partname,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 7, bottom: 8, right: 10),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {},
              child: Consumer<Cart>(
                builder: (context, value, ch) =>
                    Badge(child: ch, value: cartData.itemCount),
                child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(CartScreen.routeName);
                    }),
              ),
            ),
          ),
        ],
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
                child: companyItem.parts.partImageUrl != null
                    ? Image.network(
                        companyItem.parts.partImageUrl,
                        fit: BoxFit.fill,
                      )
                    : Image(
                        image: AssetImage("assets/images/no_image.jpg"),
                        fit: BoxFit.fill,
                      ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Container(
                  child: Image.network(
                    companyItem.companyImage,
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).accentColor)),
                  height: 80,
                  width: 90,
                ),
                title: Text(
                  companyItem.companyName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  companyItem.location.locationName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${companyItem.parts.car.carName} ",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${companyItem.parts.car.brand} ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '₹ ${companyItem.parts.partPrice}',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                isAvailable ? "AVAILABLE" : "NOT AVAILABLE",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 20),
              if (companyItem.parts.description != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      companyItem.parts.description,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Text(
                "ADD TO CART",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 10),
              Builder(
                  builder: (context) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                cartData.removeSingleItem(companyItem.parts.id,
                                    companyItem.companyId);
                              });
                            },
                            color: Colors.red,
                          ),
                          SizedBox(width: 10),
                          FlatButton(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                cartData.addNewItem(
                                    carId,
                                    companyItem.parts.id,
                                    companyItem.companyId,
                                    companyItem.parts.partPrice,
                                    companyItem.parts.partname);
                              });
                              if (cartData.items.isNotEmpty) {
                                if (cartData.items.values
                                        .toList()[0]
                                        .companyId !=
                                    companyId) {
                                  Scaffold.of(context).hideCurrentSnackBar();
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Either buy from same company or clear the cart"),
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              } else {
                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Already added to cart"),
                                  duration: Duration(seconds: 2),
                                  action: SnackBarAction(
                                      label: "UNDO",
                                      onPressed: () {
                                        cartData.removeSingleItem(
                                          companyItem.parts.id,
                                          companyItem.companyId,
                                        );
                                      }),
                                ));
                              }
                            },
                            color: Colors.green,
                          )
                        ],
                      )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: !cartData.items.containsKey(companyItem.parts.id)
                      ? Text(
                          'No Item Selected',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      : (cartData.items[companyItem.parts.id].companyId
                                      .toString() ==
                                  companyItem.companyId.toString() &&
                              cartData.items[companyItem.parts.id].quantity
                                      .toString() !=
                                  null)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${cartItem.quantity} Items Selected',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' ₹ ${cartItem.price * cartItem.quantity}',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              'No Item Selected',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
