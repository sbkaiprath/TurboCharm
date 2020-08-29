import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/user/screen/select_car_screen.dart';
import 'package:turbocharm/user/screen/user_login_screen.dart';

class UserWrapper extends StatefulWidget {
  static const routeName= '/user_wrapper';
  @override
  _UserWrapperState createState() => _UserWrapperState();
}

class _UserWrapperState extends State<UserWrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<fb.User>(context);
    return user == null ? UserLoginScreen() : SelectCarScreen();
  }
}
