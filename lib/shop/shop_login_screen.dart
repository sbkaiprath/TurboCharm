import 'package:flutter/material.dart';
import 'package:turbocharm/shop/bottom_navbar.dart';

class ShopLoginScreen extends StatefulWidget {
  static const routeName = 'shop-login';

  @override
  _ShopLoginScreenState createState() => _ShopLoginScreenState();
}

class _ShopLoginScreenState extends State<ShopLoginScreen> {
  bool receive = true;

  void _onReceiveChanged(bool newValue) => setState(() {
        receive = newValue;
        if (receive) {
        } else {}
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ),
              SizedBox(height: 50),
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
              SizedBox(height: 60),
              Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, BottomNavbar.routeName);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage('assets/images/google.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sign In with Google',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .65,
                      child: CheckboxListTile(
                        title: Text(
                          "Receive promotional mails from TurboCharm ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        value: receive,
                        checkColor: Colors.black,
                        activeColor: Colors.white,

                        onChanged: _onReceiveChanged,
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13),
              Text(
                "By tapping Continue a user linked agreements and then must click the \"Agree and Continue\" box which further makes it clear to the user that an agreement is taking place.",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ));
  }
}

// class UserLoginScreen extends StatelessWidget {
//   static const routeName = '/user_login';

//   @override
//   Widget build(BuildContext context) {
//     return
