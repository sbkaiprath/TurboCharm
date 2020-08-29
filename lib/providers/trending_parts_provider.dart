import 'package:flutter/foundation.dart';
import '../models/trending_models.dart';
import '../models/car.dart';
import 'company_provider.dart';

class TrendingModel with ChangeNotifier {
  List<TrendingModelItem> _items = [
    TrendingModelItem(
        id: '3',
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
        partPrice: 500,
        partname: "Door Bush ",
        description:
            "Condition- New Color as shown Packing includes 1 pcs only",
        company: CompanyItem(
          companyId: 'qsdd55',
          companyName: "Karunans Limit",
          location: Location(8545, 'Chandakavera', 6566),
          companyImage:
              'https://www.smergers.com/media/businessphoto/46804-1592977306-8024aa83-c9e8-41d9-864b-7df2468653be.png',
        )),
    TrendingModelItem(
        id: '2',
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZ_7CyXFHWXtb7d3EeU6mMZQEH35VjLIF3ug&usqp=CAU",
        partPrice: 200,
        partname: "Door Plate",
        description:
            "Made of high quality stainless steel with Silver Chrome Finish For all side enteranceEasy and quick installation, comes with automotive adhesive tape Door sill plates helps protect the interior door sills from scratches",
        company: CompanyItem(
          companyId: 'qsdd55',
          companyName: "Karunans Limit",
          location: Location(8545, 'Chandakavera', 6566),
          companyImage:
              'https://www.smergers.com/media/businessphoto/46804-1592977306-8024aa83-c9e8-41d9-864b-7df2468653be.png',
        )),
    TrendingModelItem(
        id: '1',
        car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
        partImageUrl:
            "https://sc01.alicdn.com/kf/HTB1w24fBb9YBuNjy0Fgq6AxcXXan.jpg",
        partPrice: 300,
        partname: "Handler",
        description:
            "As its name suggests, a door handle is used to open and close car doors. It is found on both the exterior and interior sides of automobile doors, although they are used differently on each panel. The one on the outside is pulled to open the car door, while the inside door handle is used to release the door latch before you can push the door to let yourself out.",
        company: CompanyItem(
          companyId: 'qsdd55',
          companyName: "Karunans Limit",
          location: Location(8545, 'Chandakavera', 6566),
          companyImage:
              'https://www.smergers.com/media/businessphoto/46804-1592977306-8024aa83-c9e8-41d9-864b-7df2468653be.png',
        ))
  ];
  List<TrendingModelItem> get items {
    return [..._items];
  }
}
