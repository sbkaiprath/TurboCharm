import 'package:flutter/foundation.dart';

class CartItem {
  final String cartId;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.cartId,
      @required this.title,
      @required this.price,
      @required this.quantity});
}

class Cart extends ChangeNotifier {
  Map<List<String>, CartItem> _items = {};
  Map<List<String>, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addNewItem(String partId, String companyId, double price, String title) {
    if (_items.containsKey([partId, companyId])) {
      _items.update(
          [partId, companyId],
          (existingItem) => CartItem(
              cartId: existingItem.cartId,
              price: existingItem.price,
              quantity: existingItem.quantity + 1,
              title: existingItem.title));
    } else {
      _items.putIfAbsent(
          [partId, companyId],
          () => CartItem(
              cartId: DateTime.now().toString(),
              price: price,
              quantity: 1,
              title: title));
    }
    notifyListeners();
  }

  void removeSingleItem(String partId, String companyId) {
    if (!_items.containsKey([partId, companyId])) {
      return;
    }
    if (_items[[partId, companyId]].quantity > 1) {
      _items.update(
          [partId, companyId],
          (existingProduct) => CartItem(
              cartId: existingProduct.cartId,
              price: existingProduct.price,
              quantity: existingProduct.quantity - 1,
              title: existingProduct.title));
    } else {
      _items.remove([partId, companyId]);
    }
    notifyListeners();
  }

  int findLength(String partId, String companyId) {
    var n = 0;
    _items.forEach((key, value) {
      if (key == [partId, companyId]) {
        n += 1;
      }
    });
    return n;
  }
}
