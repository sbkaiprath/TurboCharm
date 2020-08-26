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
            _personalInfo(user),
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
            SizedBox(height: 20),
            _carInfo(user, context),
            
          ],
        ));
  }

  ListTile _carInfo(User user, BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            child: Image.network(user.car.imageUrl, fit: BoxFit.fill),
            height: 80,
            width: 90),
      ),
      title: Text(user.car.carName,
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold)),
      subtitle: Text(
        user.car.brand,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: Icon(Icons.edit, color: Colors.white, size: 18),
        onPressed: () => showDialog(
          context: context,
          child: SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(32)),
            children: <Widget>[
              DropdownWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _personalInfo(User user) {
    return Padding(
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
              Text(user.email,
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
              SizedBox(height: 10),
              Text(user.mobile.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          SizedBox(width: 10),
          IconButton(
              icon: Icon(Icons.edit, color: Colors.white, size: 18),
              onPressed: null)
        ],
      ),
    );
  }
}
