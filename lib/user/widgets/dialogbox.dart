import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/company_provider.dart';
import '../../providers/cart_provider.dart';

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
        itemBuilder: (context, index) =>
            EachItem(itemList.getCompanies(id, carId)[index]),
        itemCount: itemList.getCompanies(id, carId).length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class EachItem extends StatefulWidget {
  final ModificationCompanyItem item;
  EachItem(this.item);
  @override
  _EachItemState createState() => _EachItemState();
}

class _EachItemState extends State<EachItem> {
  var check = false;
  var result = 'No item available';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    //print(cartData.items);
    //print(cartData.items[widget.item.parts.id].quantity);
    return !check
        ? Card(
            shadowColor: Colors.grey,
            elevation: 7,
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).accentColor,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    widget.item.parts.partImageUrl,
                  ),
                ),
              ),
              title: Text(widget.item.companyName),
              trailing: IconButton(
                  icon: Icon(
                    Icons.expand_more,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      check = true;
                    });
                  }),
            ))
        : Card(
            shadowColor: Colors.grey,
            elevation: 7,
            child: Container(
              height: 250,
              width: double.maxFinite,
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            Icons.expand_less,
                            size: 50,
                          ),
                          onPressed: () {
                            setState(() {
                              check = false;
                            });
                          })
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).accentColor,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            widget.item.parts.partImageUrl,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: widget.item.companyName),
                            TextSpan(
                                text: '\n${widget.item.location.locationName}',
                                style: TextStyle(fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      Text(
                        '₹ ${widget.item.parts.partPrice}',
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            cartData.addNewItem(
                                widget.item.parts.id,
                                widget.item.companyId,
                                widget.item.parts.partPrice,
                                widget.item.parts.partname);
                          });
                        },
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            cartData.removeSingleItem(
                                widget.item.parts.id, widget.item.companyId);
                          });
                        },
                        color: Colors.red,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  cartData.items.isEmpty
                      ? Text(
                          'No item selected',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context).accentColor),
                        )
                      : (cartData.items[widget.item.parts.id].companyId
                                      .toString() ==
                                  widget.item.companyId.toString() &&
                              cartData.items[widget.item.parts.id].quantity
                                      .toString() !=
                                  null)
                          ? Text(
                              '${cartData.items[widget.item.parts.id].quantity.toString()} item(s) selected',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).accentColor),
                            )
                          : Text(
                              'No item selected',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).accentColor),
                            )
                ],
              ),
            ),
          );
  }
}
