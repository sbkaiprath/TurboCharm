import 'package:flutter/foundation.dart';

class CartItem {
  final String cartId;
  final String title;
  final int quantity;
  final String companyId;
  final double price;

  CartItem(
      {@required this.cartId,
      @required this.title,
      @required this.price,
      @required this.companyId,
      @required this.quantity});
}

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addNewItem(String partId, String companyId, double price, String title) {
    if (_items.containsKey(partId)) {
      if (_items[partId].companyId == companyId) {
        _items.update(
            partId,
            (existingItem) => CartItem(
                cartId: existingItem.cartId,
                price: existingItem.price,
                quantity: existingItem.quantity + 1,
                title: existingItem.title,
                companyId: existingItem.companyId));
      } else {
        return;
      }
    } else {
      if (_items.isNotEmpty) {
        var listItems = _items.values.toList();
        listItems.forEach((element) {
          if (element.companyId != companyId) {
            return;
          }
        });
      }
      _items.putIfAbsent(
          partId,
          () => CartItem(
              cartId: DateTime.now().toString(),
              price: price,
              quantity: 1,
              title: title,
              companyId: companyId));
    }
    notifyListeners();
  }

  void removeSingleItem(String partId, String companyId) {
    if (!_items.containsKey(partId)) {
      return;
    }
    if (_items[partId].companyId == companyId) {
      if (_items[partId].quantity > 1) {
        _items.update(
            partId,
            (existingProduct) => CartItem(
                cartId: existingProduct.cartId,
                price: existingProduct.price,
                quantity: existingProduct.quantity - 1,
                title: existingProduct.title,
                companyId: companyId));
      } else {
        _items.remove(partId);
      }
    } else {
      return;
    }

    notifyListeners();
  }

  /*int findLength(String partId, String companyId) {
    var n = 0;
    _items.forEach((key, value) {
      if (key == partId) {
        n += 1;
      }
    });
    return n;
  }*/
}
