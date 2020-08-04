import 'package:flutter/foundation.dart';
import '../models/parts.dart';

class Location {
  final String locationName;
  final double lattitude;
  final double longitude;

  Location(this.lattitude, this.locationName, this.longitude);
}

class ModificationCompanyItem {
  final String companyName;
  final String companyId;
  final Location location;
  final Parts parts;

  ModificationCompanyItem(
      {@required this.companyId,
      @required this.companyName,
      @required this.location,
      @required this.parts});
}

class ModificationCompany with ChangeNotifier {
  List<ModificationCompanyItem> _items = [];

  List<ModificationCompanyItem> get items {
    return [..._items];
  }
}
