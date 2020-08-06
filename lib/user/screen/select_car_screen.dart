import 'package:flutter/material.dart';
import '../widgets/dropdownbar.dart';

class SelectCarScreen extends StatelessWidget {
  static const routeName = '/select_car';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: mediaQuery.size.height * 1,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    // alignment: FractionalOffset.topCenter,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/car_background.jpg"))),
          ),
          Container(
            height: mediaQuery.size.height * 1,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black38),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Choose Car',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: <Widget>[
                      DropdownWidgets(),
                    ],
                  ),

                  /*
                  Form(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: mediaQuery.size.width * 0.08,
                          right: mediaQuery.size.width * 0.08),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search vehicle model",
                            fillColor: Theme.of(context).indicatorColor,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Theme.of(context).indicatorColor))),
                      ),
                    ),
                  ),*/

                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: 'I: '),
                        TextSpan(
                          text:
                              'you can always change this in future. a\n default vehicle will help us provide latest and \ntrending upgrades for your vehicles',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
