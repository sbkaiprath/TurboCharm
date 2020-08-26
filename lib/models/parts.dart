import 'package:flutter/foundation.dart';
import './car.dart';

class Parts {
  final String id;
  final Car car;
  final String partname;
  final double partPrice;
  final String partImageUrl;
  final String description;
  final bool isAvailable;

  Parts({
    @required this.id,
    @required this.car,
    @required this.partImageUrl,
    @required this.partPrice,
    @required this.partname,
    this.description,
    this.isAvailable = true,
  });
}
