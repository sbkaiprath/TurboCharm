import 'package:flutter/foundation.dart';
import '../models/parts.dart';
import '../models/car.dart';

class PartProvider with ChangeNotifier {
  List<Parts> _items = [
    Parts(
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl: null,
        partPrice: 500,
        partname: "Door Bush"),
    Parts(
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl: null,
        partPrice: 200,
        partname: "Door Plate"),
    Parts(
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl: null,
        partPrice: 300,
        partname: "Handler"),
    Parts(
        car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
        partImageUrl: null,
        partPrice: 700,
        partname: "Door Bush"),
    Parts(
        car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
        partImageUrl: null,
        partPrice: 200,
        partname: "Door Plate"),
    Parts(
        car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
        partImageUrl: null,
        partPrice: 700,
        partname: "Door Bush"),
    Parts(
        car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
        partImageUrl: null,
        partPrice: 700,
        partname: "Door Bush"),
    Parts(
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl: "",
        partPrice: 3500,
        partname: "Door Handler"),
    Parts(
        car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
        partImageUrl: "",
        partPrice: 2000,
        partname: "Sound Motor"),
    Parts(
        car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
        partImageUrl: "",
        partPrice: 1000,
        partname: "Steering adjuster")
  ];
  List<Parts> get items {
    return [..._items];
  }

  List<dynamic> getParts(String id) {
    var parts = [];
    _items.forEach((element) {
      if (element.car.id == id) {
        parts.add(element);
      }
    });
    return parts;
  }
}
