import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/car_provider.dart';
import 'package:turbocharm/providers/cart_provider.dart';
import 'package:turbocharm/providers/company_provider.dart';
import 'package:turbocharm/providers/order_provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import 'package:turbocharm/section.dart';
import 'package:turbocharm/shop/bottom_navbar.dart';
import 'package:turbocharm/shop/services/edit_item.dart';
import 'package:turbocharm/shop/services/item_detail.dart';
import './user/screen/login_screen.dart';
import './user/screen/select_car_screen.dart';
import './user/widgets/bottom_navigation.dart';
import 'package:turbocharm/shop/shop_login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CarProvider()),
        ChangeNotifierProvider.value(value: PartProvider()),
        ChangeNotifierProvider.value(value: OrderProvider()),
        ChangeNotifierProvider.value(value: ModificationCompany()),
        ChangeNotifierProvider.value(value: Cart())
      ],
      child: MaterialApp(
        title: 'Turbo Charm',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(19, 19, 20, 1),
          accentColor: Color.fromRGBO(29, 181, 29, 1),
          primaryColorLight: Color.fromRGBO(25, 25, 27, 1),
          backgroundColor: Color.fromRGBO(19, 19, 20, 1),
          secondaryHeaderColor: Colors.white,
          buttonColor: Color.fromRGBO(29, 181, 29, 1),
          cardColor: Colors.white,
          canvasColor: Color.fromRGBO(19, 19, 20, 1),
          indicatorColor: Colors.white70,
          fontFamily: "IBMPlexSans",
          textTheme: TextTheme(
            subtitle1: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 21,
            ),
            bodyText1: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 17,
            ),
            bodyText2: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
            ),
          ),
        ),
        home: Section(),
        routes: {
          Section.routeName: (ctx) => Section(),
          UserLoginScreen.routeName: (ctx) => UserLoginScreen(),
          SelectCarScreen.routeName: (ctx) => SelectCarScreen(),
          BottomDownBar.routeName: (ctx) => BottomDownBar(),
          ShopLoginScreen.routeName: (ctx) => ShopLoginScreen(),
          BottomNavbar.routeName: (ctx) => BottomNavbar(),
          ItemDetail.routeName: (ctx) => ItemDetail(),
          EditItem.routeName: (ctx) => EditItem(),
        },
      ),
    );
  }
}
