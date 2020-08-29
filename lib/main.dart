import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/providers/car_provider.dart';
import 'package:turbocharm/providers/cart_provider.dart';
import 'package:turbocharm/providers/company_provider.dart';
import 'package:turbocharm/providers/order_provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';
import 'package:turbocharm/providers/user_provider.dart';
import 'package:turbocharm/section.dart';
import 'package:turbocharm/services/auth.dart';
import 'package:turbocharm/shop/bottom_navbar.dart';
import 'package:turbocharm/shop/services/edit_item.dart';
import 'package:turbocharm/shop/services/item_detail.dart';
import 'package:turbocharm/user/screen/home/part_shop.dart';
import 'package:turbocharm/user/screen/home/part_options.dart';
import 'package:turbocharm/user/user_wrapper.dart';
import 'user/screen/user_login_screen.dart';
import './user/screen/select_car_screen.dart';
import './user/widgets/bottom_navigation.dart';
import 'package:turbocharm/shop/shop_login_screen.dart';
import './user/screen/cart/cart_screen.dart';
import './providers/service_provider.dart';
import './providers/trending_parts_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<fb.User>.value(
      value: AuthService().user,
      child: MaterialApp(
          home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CarProvider()),
          ChangeNotifierProvider.value(value: PartProvider()),
          ChangeNotifierProvider.value(value: OrderProvider()),
          ChangeNotifierProvider.value(value: CompanyItems()),
          ChangeNotifierProvider.value(value: Cart()),
          ChangeNotifierProvider.value(value: UserProvider()),
          ChangeNotifierProvider.value(value: ServiceProviders()),
          ChangeNotifierProvider.value(value: TrendingModel())
        ],
        child: MaterialApp(
          title: 'Turbo Log',
          theme: ThemeData(
            primaryColor: Color.fromRGBO(35, 31, 32, 1),
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
            UserWrapper.routeName: (ctx) => UserWrapper(),
            UserLoginScreen.routeName: (ctx) => UserLoginScreen(),
            SelectCarScreen.routeName: (ctx) => SelectCarScreen(),
            BottomDownBar.routeName: (ctx) => BottomDownBar(),
            ShopLoginScreen.routeName: (ctx) => ShopLoginScreen(),
            BottomNavbar.routeName: (ctx) => BottomNavbar(),
            ItemDetail.routeName: (ctx) => ItemDetail(),
            EditItem.routeName: (ctx) => EditItem(),
            PartOptions.routeName: (ctx) => PartOptions(),
            PartShop.routeName: (ctx) => PartShop(),
            CartScreen.routeName: (ctx) => CartScreen()
          },
        ),
      )),
    );
  }
}
