import 'package:flutter/foundation.dart';
import '../models/parts.dart';
import '../models/car.dart';

class PartProvider with ChangeNotifier {
  List<Parts> _items = [
    Parts(
      id: '3',
      car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
      partImageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
      partPrice: 500,
      partname: "Door Bush ",
      description: "Condition- New Color as shown Packing includes 1 pcs only",
      isAvailable: false,
    ),
    Parts(
        id: '2',
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZ_7CyXFHWXtb7d3EeU6mMZQEH35VjLIF3ug&usqp=CAU",
        partPrice: 200,
        partname: "Door Plate",
        description:
            "Made of high quality stainless steel with Silver Chrome Finish For all side enteranceEasy and quick installation, comes with automotive adhesive tape Door sill plates helps protect the interior door sills from scratches"),
    Parts(
        id: '1',
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl:
            "https://sc01.alicdn.com/kf/HTB1w24fBb9YBuNjy0Fgq6AxcXXan.jpg",
        partPrice: 300,
        partname: "Handler",
        description:
            "As its name suggests, a door handle is used to open and close car doors. It is found on both the exterior and interior sides of automobile doors, although they are used differently on each panel. The one on the outside is pulled to open the car door, while the inside door handle is used to release the door latch before you can push the door to let yourself out."),
    Parts(
        id: '125',
        car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
        partImageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71eh-HaOC4L._AC_SY355_.jpg',
        partPrice: 200,
        partname: "Door Plate"),
    Parts(
      id: '1233',
      car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
      partImageUrl: 'https://i.ytimg.com/vi/WxgFKarjdz4/hqdefault.jpg',
      partPrice: 3500,
      partname: "Door Handler",
      isAvailable: false,
    ),
    Parts(
      id: '6',
      car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
      partImageUrl:
          'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/media/267456/a-revving-maserati-engine-has-a-biological-effect-on-women-photo-248906-s-original.jpg?fill=2:1&resize=480:*',
      partPrice: 2000,
      partname: "Sound Motor",
      isAvailable: false,
    ),
    Parts(
      id: '5',
      car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
      partImageUrl:
          "https://2.imimg.com/data2/SN/IB/IMFCP-1138181/elektrische_lenkradverstellung1-250x250.jpg",
      partPrice: 1000,
      partname: "Steering adjuster",
      description:
          "To fulfill the requirements of honorable clients, we are able to offer Power Steering Adjuster with the finest quality. The offered products are manufactured using most advanced technology and optimum quality raw material at our reliable vendors'' end. In addition to this, these products are available in different specifications as per the requirement of the clients scattered across the nation FeaturesPrecisely",
    )
  ];
  List<Parts> get items {
    return [..._items];
  }

  Parts getPart(String id) =>
      _items.firstWhere((element) => element.id == id, orElse: () => null);

  List<dynamic> getParts(String id) {
    var parts = [];
    _items.forEach((element) {
      if (element.car.id == id) {
        parts.add(element);
      }
    });
    return parts;
  }

  List<Parts> available() {
    var parts = [];
    _items.forEach((element) {
      if (element.isAvailable) {
        parts.add(element);
      }
    });
    return [...parts];
  }

  List<dynamic> notAvailable() {
    var parts = [];
    _items.forEach((element) {
      if (!element.isAvailable) {
        parts.add(element);
      }
    });
    return [...parts];
  }

  Future<void> addItem(Parts item) async {
    final newItem = Parts(
        car: item.car,
        partname: item.partname,
        partPrice: item.partPrice,
        description: item.description,
        partImageUrl: item.partImageUrl,
        id: "111");

    _items.add(newItem);
    notifyListeners();
  }

  Future<void> updateItem(String id, Parts newItem) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newItem;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteItem(String id) async {
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    _items.removeAt(existingProductIndex);
    notifyListeners();
  }
}
