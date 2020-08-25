import 'package:flutter/material.dart';
import 'package:turbocharm/models/car.dart';
import 'package:turbocharm/models/order.dart';
import 'package:turbocharm/models/parts.dart';
import 'package:turbocharm/providers/user_provider.dart';

class OrderProvider with ChangeNotifier {
  List<OrderItem> _orders = [
    OrderItem(
      id: null,
      orderStatus: OrderStatus.pending,
      user: User(name: "Sura", mobile: 2345671234, email: "sura@gmail.com"),
      dateTime: DateTime.now(),
      total: 700,
      parts: [
        Parts(
          id: '5',
          car: Car(id: 'car125', brand: 'Suzuki', carName: "Iniesta"),
          partImageUrl:
              "https://2.imimg.com/data2/SN/IB/IMFCP-1138181/elektrische_lenkradverstellung1-250x250.jpg",
          partPrice: 1000,
          partname: "Steering adjuster",
          description:
              "To fulfill the requirements of honorable clients, we are able to offer Power Steering Adjuster with the finest quality. The offered products are manufactured using most advanced technology and optimum quality raw material at our reliable vendors'' end. In addition to this, these products are available in different specifications as per the requirement of the clients scattered across the nation FeaturesPrecisely",
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
      ],
    ),
    OrderItem(
      id: null,
      orderStatus: OrderStatus.pending,
      user:
          User(name: "Krish", mobile: 2345671234, email: "ramettan@gmail.com"),
      dateTime: DateTime.now(),
      total: 3000,
      isFirst: false,
      parts: [
        Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 500,
          partname: "Door Bush ",
          description:
              "Condition- New Color as shown Packing includes 1 pcs only",
          isAvailable: false,
        ),
        Parts(
          id: '6',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl: null,
          partPrice: 2000,
          partname: "Sound Motor",
          isAvailable: false,
        ),
      ],
    ),
    OrderItem(
      id: null,
      orderStatus: OrderStatus.accepted,
      user:
          User(name: "Navani", mobile: 2345671234, email: "ramettan@gmail.com"),
      dateTime: DateTime.now(),
      total: 3000,
      isFirst: false,
      parts: [
        Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 500,
          partname: "Door Bush ",
          description:
              "Condition- New Color as shown Packing includes 1 pcs only",
          isAvailable: false,
        ),
        Parts(
          id: '6',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl: null,
          partPrice: 2000,
          partname: "Sound Motor",
          isAvailable: false,
        ),
      ],
    ),
    OrderItem(
      id: null,
      orderStatus: OrderStatus.accepted,
      user: User(name: "Ram", mobile: 2345671234, email: "ramettan@gmail.com"),
      dateTime: DateTime.now(),
      total: 3000,
      isFirst: true,
      parts: [
        Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 500,
          partname: "Door Bush ",
          description:
              "Condition- New Color as shown Packing includes 1 pcs only",
          isAvailable: false,
        ),
        Parts(
          id: '6',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl: null,
          partPrice: 2000,
          partname: "Sound Motor",
          isAvailable: false,
        ),
      ],
    ),
    OrderItem(
      id: null,
      orderStatus: OrderStatus.completed,
      user:
          User(name: "Kichu", mobile: 2345671234, email: "ramettan@gmail.com"),
      dateTime: DateTime.now(),
      total: 3000,
      isFirst: true,
      parts: [
        Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 500,
          partname: "Door Bush ",
          description:
              "Condition- New Color as shown Packing includes 1 pcs only",
          isAvailable: false,
        ),
        Parts(
          id: '6',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl: null,
          partPrice: 2000,
          partname: "Sound Motor",
          isAvailable: false,
        ),
      ],
    ),
    OrderItem(
      id: null,
      orderStatus: OrderStatus.completed,
      user:
          User(name: "Shuaib", mobile: 2345671234, email: "ramettan@gmail.com"),
      dateTime: DateTime.now(),
      total: 3000,
      isFirst: false,
      parts: [
        Parts(
          id: '3',
          car: Car(id: '855d5', brand: "Honda", carName: "Amaze"),
          partImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfddVUROpvEfM-4fr9fnk-2RD4_x5UlWQQQQ&usqp=CAU",
          partPrice: 500,
          partname: "Door Bush ",
          description:
              "Condition- New Color as shown Packing includes 1 pcs only",
          isAvailable: false,
        ),
        Parts(
          id: '6',
          car: Car(id: 'car124', brand: 'Hero', carName: "Escalator"),
          partImageUrl: null,
          partPrice: 2000,
          partname: "Sound Motor",
          isAvailable: false,
        ),
      ],
    ),
  ];

  List<OrderItem> get orders => List.from(_orders);

  List<OrderItem> get acceptedOrders {
    var orders = [];
    _orders.forEach((element) {
      if (element.orderStatus == OrderStatus.accepted) {
        orders.add(element);
      }
    });
    return [...orders];
  }

  List<OrderItem> get pendingOrders {
    var orders = [];
    _orders.forEach((element) {
      if (element.orderStatus == OrderStatus.pending) {
        orders.add(element);
      }
    });
    return [...orders];
  }

  List<OrderItem> get completedOrders {
    var orders = [];
    _orders.forEach((element) {
      if (element.orderStatus == OrderStatus.completed) {
        orders.add(element);
      }
    });
    return [...orders];
  }

  void addOrder(
    User user,
    List<Parts> parts,
    double total,
    OrderStatus orderStatus,
  ) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        user: user,
        dateTime: DateTime.now(),
        parts: parts,
        total: total,
        orderStatus: orderStatus,
      ),
    );
    notifyListeners();
  }
}
