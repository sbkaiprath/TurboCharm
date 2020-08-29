import 'package:flutter/foundation.dart';
import '../models/car.dart';

class CarProvider with ChangeNotifier {
  List<Car> _items = [
    Car(
      id: '855d5',
      brand: "Honda",
      carName: "Amaze",
      imageUrl:
          'https://images.unsplash.com/photo-1542362567-b07e54358753?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    ),
    Car(
      id: '8565k',
      brand: 'Hero',
      carName: 'Splender',
      imageUrl:
          'https://specials-images.forbesimg.com/imageserve/5d35eacaf1176b0008974b54/960x0.jpg?cropX1=790&cropX2=5350&cropY1=784&cropY2=3349',
    ),
    Car(
      id: 'car124',
      brand: 'Hero',
      carName: "Escalator",
      imageUrl:
          'https://www.extremetech.com/wp-content/uploads/2019/12/SONATA-hero-option1-764A5360-edit.jpg',
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
