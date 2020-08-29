import 'package:flutter/foundation.dart';
import './car.dart';
import '../providers/company_provider.dart';

class TrendingModelItem {
  final String id;
  final String partname;
  final double partPrice;
  final String description;
  final String partImageUrl;
  final Car car;
  final CompanyItem company;

  TrendingModelItem({
    @required this.id,
    @required this.car,
    @required this.partname,
    @required this.partPrice,
    @required this.description,
    @required this.partImageUrl,
    @required this.company,
  });
}
