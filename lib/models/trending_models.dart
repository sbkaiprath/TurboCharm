import 'package:flutter/foundation.dart';
import './car.dart';
import '../providers/company_provider.dart';

class TrendingModelItem {
  final String id;
  final String partName;
  final double partPrice;
  final String description;
  final String partImageUrl;
  final Car car;
  final Location location;
  final ModificationCompanyItem company;

  TrendingModelItem(
      {@required this.id,
      @required this.car,
      @required this.partName,
      @required this.partPrice,
      @required this.description,
      @required this.partImageUrl,
      @required this.company,
      @required this.location});
}
