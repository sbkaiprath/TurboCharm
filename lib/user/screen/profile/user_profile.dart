import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/models/car.dart';
import 'package:turbocharm/models/user_data.dart';
import 'package:turbocharm/providers/car_provider.dart';
import 'package:turbocharm/services/auth.dart';
import 'package:turbocharm/services/database.dart';
import 'package:turbocharm/services/loading.dart';
import 'package:turbocharm/user/screen/cart/cart_screen.dart';
import 'package:turbocharm/user/screen/select_car_screen.dart';
import '../../../providers/cart_provider.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainuser = Provider.of<fb.User>(context);

    return mainuser == null
        ? Loading()
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              children: [
                _personalInfo(mainuser),
                SizedBox(height: 10),
                RaisedButton(
                  onPressed: () async {
                    bool res = await AuthService()
                        .signOutGoogle()
                        .whenComplete(() => Navigator.of(context).pop());
                    if (res) {
                      print("user profile logging out");
                    }
                  },
                  disabledColor: Theme.of(context).accentColor,
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                _carInfo(mainuser, context),
                Divider(
                  height: 5,
                  thickness: 0,
                  color: Colors.white,
                  indent: 15,
                  endIndent: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  child: Card(
                    margin: EdgeInsets.all(0),
                    color: Theme.of(context).primaryColor,
                    elevation: 0,
                    child: ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: null),
                      title: Text(
                        'My Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: Colors.white,
                  indent: 15,
                  endIndent: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  child: Card(
                    margin: EdgeInsets.all(0),
                    color: Theme.of(context).primaryColor,
                    elevation: 0,
                    child: ListTile(
                      leading: Icon(
                        Icons.assignment_turned_in,
                        color: Colors.white,
                      ),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: null),
                      title: Text(
                        'My Orders',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 0,
                  color: Colors.white,
                  indent: 15,
                  endIndent: 15,
                )
              ],
            ));
  }

  Widget _carInfo(fb.User user, BuildContext context) {
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final carData = Provider.of<CarProvider>(context, listen: false);
            UserData userData = snapshot.data;
            Car car = carData.findById(userData.userCarId);
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                    child: Image.network(car.imageUrl, fit: BoxFit.fill),
                    height: 80,
                    width: 90),
              ),
              title: Text(car.carName,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(
                car.brand,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.edit, color: Colors.white, size: 18),
                  onPressed: () {
                    return Navigator.of(context)
                        .popAndPushNamed(SelectCarScreen.routeName);
                  }),
            );
          } else {
            return Container();
          }
        });
  }

  Padding _personalInfo(fb.User user) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          user.photoURL != null
              ? Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(user.photoURL), fit: BoxFit.cover),
                  ),
                )
              : CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    user.displayName[0] ?? 'X',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 230,
                child: Row(
                  children: [
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: user.displayName ?? ' Ram X',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(user.email ?? 'email',
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
              SizedBox(height: 10),
              if (user.phoneNumber != null)
                Text(user.phoneNumber,
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}
