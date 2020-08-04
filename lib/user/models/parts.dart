import 'package:flutter/foundation.dart';
import './car.dart';

class Parts {
  final Car car;
  final String partname;
  final double partPrice;
  final String partImageUrl;

  Parts(
      {@required this.car,
      @required this.partImageUrl,
      @required this.partPrice,
      @required this.partname});
}
