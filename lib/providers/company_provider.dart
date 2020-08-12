import 'package:flutter/foundation.dart';
import 'package:turbocharm/models/car.dart';
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

  ModificationCompanyItem({
    @required this.companyId,
    @required this.companyName,
    @required this.location,
    @required this.parts,
  });
}

class ModificationCompany with ChangeNotifier {
  List<ModificationCompanyItem> _items = [
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 500,
          partname: "Door Bush ",
          description:
              "Condition- New Color as shown Packing includes 1 pcs only",
          isAvailable: false,
        )),
    ModificationCompanyItem(
        companyId: 'qsdd56',
        companyName: "Ramans Colony",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 500,
          partname: "Door Bush ",
          description:
              "Condition- New Color as shown Packing includes 1 pcs only",
          isAvailable: false,
        )),
    ModificationCompanyItem(
        companyId: 'qsd756',
        companyName: "Ramans Colony",
        location: Location(845, 'Chengannur', 6.66),
        parts: Parts(
          id: '6',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl:
              'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/media/267456/a-revving-maserati-engine-has-a-biological-effect-on-women-photo-248906-s-original.jpg?fill=2:1&resize=480:*',
          partPrice: 2000,
          partname: "Sound Motor",
          isAvailable: false,
        )),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
            id: "3",
            car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
            partImageUrl:
                "https://2.imimg.com/data2/SN/IB/IMFCP-1138181/elektrische_lenkradverstellung1-250x250.jpg",
            partPrice: 1000,
            partname: "Steering adjuster")),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
          id: '69',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://images-na.ssl-images-amazon.com/images/I/61QLwvHY5ML._AC_SL1500_.jpg",
          partPrice: 4200,
          partname: "Exhaust Manifold",
          description:
              "Simple cast iron or stainless steel units which collect engine exhaust gas from multiple cylinders and deliver it to the exhaust pipe",
        )),
    ModificationCompanyItem(
      companyId: 'qsd7w5',
      companyName: "Valsan House",
      location: Location(8.45, 'Koothathukulam', 6.86),
      parts: Parts(
          id: '2',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZ_7CyXFHWXtb7d3EeU6mMZQEH35VjLIF3ug&usqp=CAU",
          partPrice: 200,
          partname: "Door Plate",
          description:
              "Made of high quality stainless steel with Silver Chrome Finish For all side enteranceEasy and quick installation, comes with automotive adhesive tape Door sill plates helps protect the interior door sills from scratches"),
    )
  ];

  List<ModificationCompanyItem> get items {
    return [..._items];
  }

  List<dynamic> getCompanies(String partId, String carId) {
    var listItems = [];
    _items.forEach((element) {
      if (element.parts.id == partId && element.parts.car.id == carId) {
        listItems.add(element);
      }
    });
    return listItems;
  }
}
