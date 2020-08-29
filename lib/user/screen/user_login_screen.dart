import 'package:flutter/material.dart';
import '../widgets/google_button.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class UserLoginScreen extends StatelessWidget {
  static const routeName = '/user_login';

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/car_background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black38),
              ),
              ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .965,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 200),
                        Transform.translate(
                          offset: Offset(0, 30),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: mediaQuery.size.width * 0.15,
                              right: mediaQuery.size.width * 0.15),
                          child: GoogleButton(),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Transform.translate(
                          offset: Offset(15, 0),
                          child: ReceivePromotion(),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Transform.translate(
                          offset: Offset(-mediaQuery.size.width * 0.28, 0),
                          child: Text(
                            'More Options',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'By Tapping Continue a User Linked agreements\n and then must click the "Agree and Continue"\nbox which further makes it clear to the user to an Agreement is taking place.',
                            style: TextStyle(
                                color: Theme.of(context).indicatorColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReceivePromotion extends StatefulWidget {
  const ReceivePromotion({
    Key key,
  }) : super(key: key);

  @override
  _ReceivePromotionState createState() => _ReceivePromotionState();
}

class _ReceivePromotionState extends State<ReceivePromotion> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        selected: true,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          "Receive promotional mails from \nAuto Charm",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        activeColor: Theme.of(context).accentColor,
        value: timeDilation != 1.0,
        onChanged: (value) {
          setState(() {
            timeDilation = value ? 3.0 : 1.0;
          });
        });
  }
}
