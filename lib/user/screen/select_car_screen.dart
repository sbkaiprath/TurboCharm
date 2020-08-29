import 'package:flutter/material.dart';
import '../widgets/dropdownbar.dart';

class SelectCarScreen extends StatelessWidget {
  static const routeName = '/select_car';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/black_logo.png',
                  fit: BoxFit.cover,
                ),
                // colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'CHOOSE YOUR CAR',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 25,
                        ),
                      ),
                      DropdownWidgets(),
                      Text(
                        'You can always change this in future !\nA default vehicle will help us provide latest  \nand trending upgrades for your vehicles .',
                        style: TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ));
  }
}

// Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: mediaQuery.size.height * 1,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 // alignment: FractionalOffset.topCenter,
//                 fit: BoxFit.cover,
//                 image: AssetImage('assets/images/name_logo.png'),
//               ),
//             ),
//           ),
//           Container(
//             height: mediaQuery.size.height * 1,
//             width: double.infinity,
//             decoration: BoxDecoration(color: Colors.black38),
//           ),

//         ],
//       ),
//     );
//   }
// }

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
