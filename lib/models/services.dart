import 'package:flutter/foundation.dart';
import '../providers/company_provider.dart';
import './car.dart';

class Services {
  final String id;
  final String serviceName;
  final String serviceImageUrl;
  final CompanyItem companyItem;
  final int servicePrice;
  final Car carType;

  Services(
      {@required this.serviceImageUrl,
      @required this.id,
      @required this.companyItem,
      @required this.servicePrice,
      @required this.serviceName,
      this.carType});
}
