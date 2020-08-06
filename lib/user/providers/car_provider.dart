import 'package:flutter/foundation.dart';
import '../models/car.dart';

class CarProvider with ChangeNotifier {
  List<Car> _items = [
    Car(id: '855d5', brand: "Honda", carName: "Amaze"),
    Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
    Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
    Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta")
  ];
  List<Car> get items {
    return [..._items];
  }

  List<dynamic> carName(String brandName) {
    var cars = [];
    _items.forEach((element) {
      if (element.brand == brandName) {
        cars.add(element.carName);
      }
    });
    return cars;
  }

  Car findId(String carName, String brandName) {
    return _items.firstWhere(
        (element) => element.brand == brandName && element.carName == carName);
  }
}
