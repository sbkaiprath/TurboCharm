import 'package:flutter/widgets.dart';
import 'package:turbocharm/models/car.dart';

class User {
  final String name;
  final int mobile;
  final String address;
  final String email;
  final Car car;

  User({
    this.name = 'Ajay Ram K',
    this.mobile = 92828829129,
    this.address = 'Kannur',
    this.email = 'ajayram@gmail.com',
    this.car,
  });
}

class UserProvider with ChangeNotifier {
  User newUser = User(
    name: 'Ajay Ram K',
    mobile: 92828829129,
    address: 'Kannur',
    email: 'ajayram@gmail.com',
    car: Car(
      id: 'car124',
      brand: 'Hero',
      carName: "Escalator",
      imageUrl:
          'https://www.extremetech.com/wp-content/uploads/2019/12/SONATA-hero-option1-764A5360-edit.jpg',
    ),
  );

  User get getUser {
    return newUser;
  }

  void get updateCar {
    // newUser.update() .car.id='9';
    //  = Car(
    //     id: 'car124',
    //     brand: 'Hero',
    //     carName: "Escalator",
    //     imageUrl:
    //         'https://www.extremetech.com/wp-content/uploads/2019/12/SONATA-hero-option1-764A5360-edit.jpg',
    //   ),
  }
  void update() {}
}
