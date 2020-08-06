import 'package:flutter/foundation.dart';
import 'package:turbocharm/user/models/car.dart';
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
  List<ModificationCompanyItem> _items = [
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
            car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
            partImageUrl: "",
            partPrice: 3500,
            partname: "Door Handler")),
    ModificationCompanyItem(
        companyId: 'qsd755',
        companyName: "Ramans Colony",
        location: Location(845, 'Chengannur', 6.66),
        parts: Parts(
            car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
            partImageUrl: "",
            partPrice: 2000,
            partname: "Sound Motor")),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
            car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
            partImageUrl: "",
            partPrice: 1000,
            partname: "Steering adjuster"))
  ];

  List<ModificationCompanyItem> get items {
    return [..._items];
  }
}
