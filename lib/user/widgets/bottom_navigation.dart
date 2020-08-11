import 'package:flutter/material.dart';
import '../screen/cart_screen.dart';
import '../screen/menu_screen.dart';
import '../screen/homepage_screen.dart';

class BottomDownBar extends StatefulWidget {
  static const routeName = '/bottom_bar';

  @override
  _BottomDownBarState createState() => _BottomDownBarState();
}

class _BottomDownBarState extends State<BottomDownBar> {
  var _selectedIndex = 0;
  List<Widget> _page;
  @override
  void initState() {
    _page = [HomepageScreen(), CartScreen(), MenuScreen()];
    super.initState();
  }

  void _onSelect(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(child: _page[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Colors.white,
        fixedColor: Theme.of(context).accentColor,
        onTap: _onSelect,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Home",
                style: Theme.of(context).textTheme.subtitle1,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(
                "Cart",
                style: Theme.of(context).textTheme.subtitle1,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text(
                "Menu",
                style: Theme.of(context).textTheme.bodyText1,
              ))
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}
