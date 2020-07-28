import 'package:flutter/material.dart';

class SelectCarScreen extends StatefulWidget {
  static const routeName = '/select_car';
  @override
  _SelectCarScreenState createState() => _SelectCarScreenState();
}

class _SelectCarScreenState extends State<SelectCarScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _movementController;
  @override
  void initState() {
    _movementController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _movementController.dispose();
    super.dispose();
  }

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
              ),
              SizedBox(
                height: 50,
              ),
              IconButton(
                  onPressed: () {},
                  icon: AnimatedBuilder(
                    animation: _movementController,
                    builder: (context, child) {
                      return Transform.translate(
                          child: child,
                          offset: Offset(_movementController.value * 4, 0));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 50,
                      color: Theme.of(context).accentColor,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
