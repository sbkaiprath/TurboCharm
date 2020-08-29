import 'package:flutter/foundation.dart';
import '../models/car.dart';

class CarProvider with ChangeNotifier {
  List<Car> _items = [
    Car(
      id: '855d5',
      brand: "Honda",
      carName: "Amaze",
      imageUrl:
          'https://autotechreview.com/images/All-New-Amaze.jpg',
    ),
    Car(
      id: '8565k',
      brand: 'Hero',
      carName: 'Splender',
      imageUrl:
          'https://imgd.aeplcdn.com/1280x720/bikewaleimg/ec/480/img/l/hero-splendor-pro-front-three-quarter-7284.jpg?v=201711021421',
    ),
    Car(
      id: 'car124',
      brand: 'Hero',
      carName: "Escalator",
      imageUrl:
          'https://cdn1.acedms.com/uploads/category/yamaha/20171106064335000000-681474636627970689.jpg',
    ),
    Car(
      id: 'car125',
      brand: 'Suzuki',
      carName: "Iniesta",
      imageUrl:
          'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/body-image/public/1-corvette-stingray-c8-2019-fd-hr-hero-front_0.jpg?itok=SEYe_vLy',
    )
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

  Car findByName(String carName, String brandName) {
    return _items.firstWhere(
        (element) => element.brand == brandName && element.carName == carName);
  }

  String carIdByName(String carName, String brandName) {
    return _items
        .firstWhere((element) =>
            element.brand == brandName && element.carName == carName)
        .id;
  }

  Car findById(String carId) {
    return _items.firstWhere((element) => element.id == carId);
  }
}
