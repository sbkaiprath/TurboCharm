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
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '1233',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl: 'https://i.ytimg.com/vi/WxgFKarjdz4/hqdefault.jpg',
          partPrice: 3612,
          partname: "Door Handler",
          isAvailable: false,
        )),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
            id: '1',
            car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
            partImageUrl:
                "https://sc01.alicdn.com/kf/HTB1w24fBb9YBuNjy0Fgq6AxcXXan.jpg",
            partPrice: 300,
            partname: "Handler",
            description:
                "As its name suggests, a door handle is used to open and close car doors. It is found on both the exterior and interior sides of automobile doors, although they are used differently on each panel. The one on the outside is pulled to open the car door, while the inside door handle is used to release the door latch before you can push the door to let yourself out.")),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
            id: '125',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://images-na.ssl-images-amazon.com/images/I/71eh-HaOC4L._AC_SY355_.jpg',
            partPrice: 207,
            partname: "Door Plate")),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '69',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://images-na.ssl-images-amazon.com/images/I/61QLwvHY5ML._AC_SL1500_.jpg",
          partPrice: 4249,
          partname: "Exhaust Manifold",
          description:
              "Simple cast iron or stainless steel units which collect engine exhaust gas from multiple cylinders and deliver it to the exhaust pipe",
        )),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '20',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://image.made-in-china.com/43f34j00HjwEZIugCbpB/Ge-Emd-Alco-Diesel-Locomotive-Engine-Turbocharger-Emd-567-645-and-710-Alco131-165-320-350-520-and-720.jpg",
          partPrice: 31900,
          partname: "Turbocharger",
          description: "vroooooom",
        )),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
            id: '16',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://4.imimg.com/data4/MP/VL/MY-15471507/car-spoiler-500x500.jpg',
            partPrice: 1999,
            partname: "Rear Spoiler")),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '18',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl: 'https://fasthemis.com/images/F143836263.png',
          partPrice: 2000,
          partname: "Hood Scoop",
        )),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '6',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl:
              'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/media/267456/a-revving-maserati-engine-has-a-biological-effect-on-women-photo-248906-s-original.jpg?fill=2:1&resize=480:*',
          partPrice: 2100,
          partname: "Sound Motor",
          isAvailable: false,
        )),
    ModificationCompanyItem(
        companyId: 'qsdd55',
        companyName: "Karunans Limit",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
            id: '17',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://3d-car-shows.com/wp-content/uploads/2011/12/tiger-wheel-and-tyre-2011.jpg',
            partPrice: 2099,
            partname: "Bling Wheels")),
    ModificationCompanyItem(
        companyId: 'qsdd56',
        companyName: "Ramans Colony",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 510,
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
          id: '19',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl:
              'https://5.imimg.com/data5/TL/IY/MY-15528281/florescent-car-fog-lamp-500x500.jpg',
          partPrice: 749,
          partname: "Fog Lamp",
        )),
    ModificationCompanyItem(
        companyId: 'qsdd56',
        companyName: "Ramans Colony",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '5',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://2.imimg.com/data2/SN/IB/IMFCP-1138181/elektrische_lenkradverstellung1-250x250.jpg",
          partPrice: 899,
          partname: "Steering adjuster",
          description:
              "To fulfill the requirements of honorable clients, we are able to offer Power Steering Adjuster with the finest quality. The offered products are manufactured using most advanced technology and optimum quality raw material at our reliable vendors'' end. In addition to this, these products are available in different specifications as per the requirement of the clients scattered across the nation FeaturesPrecisely",
        )),
    ModificationCompanyItem(
        companyId: 'qsdd56',
        companyName: "Ramans Colony",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '20',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://image.made-in-china.com/43f34j00HjwEZIugCbpB/Ge-Emd-Alco-Diesel-Locomotive-Engine-Turbocharger-Emd-567-645-and-710-Alco131-165-320-350-520-and-720.jpg",
          partPrice: 29900,
          partname: "Turbocharger",
          description: "vroooooom",
        )),
    ModificationCompanyItem(
        companyId: 'qsdd56',
        companyName: "Ramans Colony",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
            id: '125',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://images-na.ssl-images-amazon.com/images/I/71eh-HaOC4L._AC_SY355_.jpg',
            partPrice: 190,
            partname: "Door Plate")),
    ModificationCompanyItem(
        companyId: 'qsdd56',
        companyName: "Ramans Colony",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
          id: '21',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://grimmermotors.co.nz/wp-content/uploads/2018/09/muffler-300x225.png",
          partPrice: 10499,
          partname: "Muffler",
        )),
    ModificationCompanyItem(
        companyId: 'qsdd56',
        companyName: "Ramans Colony",
        location: Location(8545, 'Chandakavera', 6566),
        parts: Parts(
            id: '2',
            car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
            partImageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZ_7CyXFHWXtb7d3EeU6mMZQEH35VjLIF3ug&usqp=CAU",
            partPrice: 190,
            partname: "Door Plate",
            description:
                "Made of high quality stainless steel with Silver Chrome Finish For all side enteranceEasy and quick installation, comes with automotive adhesive tape Door sill plates helps protect the interior door sills from scratches")),
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
        companyId: 'qsd756',
        companyName: "Ramans Colony",
        location: Location(845, 'Chengannur', 6.66),
        parts: Parts(
            id: '15',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://cdn11.bigcommerce.com/s-q0oivn9r3h/images/stencil/1280x1280/products/2410/2710/RPM73413-2__47824.1562596981.jpg?c=2',
            partPrice: 22559,
            partname: "Supercharger")),
    ModificationCompanyItem(
        companyId: 'qsd756',
        companyName: "Ramans Colony",
        location: Location(845, 'Chengannur', 6.66),
        parts: Parts(
          id: '1233',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl: 'https://i.ytimg.com/vi/WxgFKarjdz4/hqdefault.jpg',
          partPrice: 3500,
          partname: "Door Handler",
          isAvailable: false,
        )),
    ModificationCompanyItem(
        companyId: 'qsd756',
        companyName: "Ramans Colony",
        location: Location(845, 'Chengannur', 6.66),
        parts: Parts(
            id: '17',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://i.pinimg.com/originals/4a/b3/3c/4ab33cc5d85e95e6712464887fd0888a.jpg',
            partPrice: 4199,
            partname: "Bling Wheels")),
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
          id: '1233',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl: 'https://i.ytimg.com/vi/WxgFKarjdz4/hqdefault.jpg',
          partPrice: 3499,
          partname: "Door Handler",
          isAvailable: false,
        )),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
            id: '16',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://4.imimg.com/data4/MP/VL/MY-15471507/car-spoiler-500x500.jpg',
            partPrice: 1899,
            partname: "Rear Spoiler")),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
            id: '17',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://i.pinimg.com/originals/4a/b3/3c/4ab33cc5d85e95e6712464887fd0888a.jpg',
            partPrice: 3999,
            partname: "Bling Wheels")),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
          id: '21',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://grimmermotors.co.nz/wp-content/uploads/2018/09/muffler-300x225.png",
          partPrice: 10999,
          partname: "Muffler",
        )),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
            id: '15',
            car: Car(id: '8565k', brand: 'Hero', carName: 'Splender'),
            partImageUrl:
                'https://cdn11.bigcommerce.com/s-q0oivn9r3h/images/stencil/1280x1280/products/2410/2710/RPM73413-2__47824.1562596981.jpg?c=2',
            partPrice: 21400,
            partname: "Supercharger")),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
          id: '5',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://2.imimg.com/data2/SN/IB/IMFCP-1138181/elektrische_lenkradverstellung1-250x250.jpg",
          partPrice: 1000,
          partname: "Steering adjuster",
          description:
              "To fulfill the requirements of honorable clients, we are able to offer Power Steering Adjuster with the finest quality. The offered products are manufactured using most advanced technology and optimum quality raw material at our reliable vendors'' end. In addition to this, these products are available in different specifications as per the requirement of the clients scattered across the nation FeaturesPrecisely",
        )),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
          id: '18',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl: 'https://fasthemis.com/images/F143836263.png',
          partPrice: 1400,
          partname: "Hood Scoop",
        )),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
          id: '19',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl:
              'https://5.imimg.com/data5/TL/IY/MY-15528281/florescent-car-fog-lamp-500x500.jpg',
          partPrice: 799,
          partname: "Fog Lamp",
        )),
    ModificationCompanyItem(
        companyId: 'qsd7w5',
        companyName: "Valsan House",
        location: Location(8.45, 'Koothathukulam', 6.86),
        parts: Parts(
            id: '1',
            car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
            partImageUrl:
                "https://sc01.alicdn.com/kf/HTB1w24fBb9YBuNjy0Fgq6AxcXXan.jpg",
            partPrice: 295,
            partname: "Handler",
            description:
                "As its name suggests, a door handle is used to open and close car doors. It is found on both the exterior and interior sides of automobile doors, although they are used differently on each panel. The one on the outside is pulled to open the car door, while the inside door handle is used to release the door latch before you can push the door to let yourself out.")),
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
