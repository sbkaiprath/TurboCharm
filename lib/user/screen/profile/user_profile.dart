import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/user_provider.dart';
import 'package:turbocharm/user/widgets/dropdownbar.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).newUser;

    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      "AR",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        user.email,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        user.mobile.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: null)
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                child: Text("Logout"),
                textColor: Colors.white,
                color: Theme.of(context).accentColor,
              ),
            ),
            // ListTile(
            //   leading: Container(
            //     child: Image.network(
            //       newUser.car.imageUrl,
            //       fit: BoxFit.fill,
            //     ),
            //     height: 80,
            //     width: 90,
            //   ),
            //   title: Text(
            //     newUser.car.carName,
            //     style:
            //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            //   ),
            //   subtitle: Text(
            //     newUser.car.brand,
            //     style: TextStyle(
            //       color: Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            DropdownWidgets(),
          ],
        ));
  }
}
