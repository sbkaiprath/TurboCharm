import 'package:flutter/material.dart';
import 'package:turbocharm/user/screen/profile/user_profile.dart';
import '../screen/cart/cart_screen.dart';
import '../screen/home/homepage_screen.dart';
import '../screen/services/services_screen.dart';

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
    _page = [
      HomepageScreen(),
      ServicesHome(),
      UserProfile(),
    ];
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
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.white54),
        selectedLabelStyle: TextStyle(
          fontSize: 10.2,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w300,
        ),
        onTap: _onSelect,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Profile"),
          )
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}
