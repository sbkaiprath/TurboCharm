import 'package:flutter/foundation.dart';

class CartItem {
  final String cartId;
  final String title;
  final int quantity;
  final String companyId;
  final double price;
  final String carId;

  CartItem({
    @required this.cartId,
    @required this.title,
    @required this.price,
    @required this.companyId,
    @required this.quantity,
    @required this.carId,
  });
}

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items = {
    /* '20': CartItem(
      cartId: 'dgsdhu95959',
      title: 'Turbocharger',
      price: 29900,
      companyId: 'qsdd56',
      quantity: 2,
      carId: 'car125',
    ),
    '21': CartItem(
      cartId: 'dgsdhu95959',
      title: 'Turbocharger',
      price: 29900,
      companyId: 'qsdd56',
      quantity: 2,
      carId: 'car125',
    ),*/
  };
  Map<String, CartItem> get items {
    return _items;
  }

  int get itemCount {
    return _items.length;
  }

  double get getTotalCharge {
    double sum = 0;
    _items.values.forEach((element) {
      sum = sum + (element.price * element.quantity);
    });
    return sum;
  }

  bool isContainPartItem(String partId) {
    return _items.containsKey(partId) ? true : false;
  }

  void addNewItem(
    String carId,
    String partId,
    String companyId,
    double price,
    String title,
  ) {
    if (_items.containsKey(partId)) {
      if (_items[partId].companyId == companyId) {
        _items.update(
            partId,
            (existingItem) => CartItem(
                carId: existingItem.carId,
                cartId: existingItem.cartId,
                price: existingItem.price,
                quantity: existingItem.quantity + 1,
                title: existingItem.title,
                companyId: existingItem.companyId));
      } else {
        return;
      }
    } else {
      var n;
      if (_items.isNotEmpty) {
        var listItems = _items.values.toList();
        print(listItems[0].title);
        listItems[0].companyId != companyId ? n = 1 : n = 0;
      }
      if (_items.isEmpty) {
        _items.putIfAbsent(
            partId,
            () => CartItem(
                carId: carId,
                cartId: DateTime.now().toString(),
                price: price,
                quantity: 1,
                title: title,
                companyId: companyId));
      } else if (n == 0) {
        _items.putIfAbsent(
            partId,
            () => CartItem(
                carId: carId,
                cartId: _items.values.toList()[0].cartId,
                price: price,
                quantity: 1,
                title: title,
                companyId: _items.values.toList()[0].companyId));
      }
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
                carId: existingProduct.carId,
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
