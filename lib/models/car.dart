import 'package:flutter/foundation.dart';

class Car {
  final String id;
  final String brand;
  final String carName;
  final String modelNumber;
  final String imageUrl;

  Car(
      {@required this.id,
      @required this.brand,
      @required this.carName,
      this.imageUrl,
      this.modelNumber});
}
