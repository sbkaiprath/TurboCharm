import 'package:flutter/material.dart';
import 'package:turbocharm/shop/bookings/bookings.dart';
import 'package:turbocharm/shop/profile/profile.dart';
import 'package:turbocharm/shop/services/services.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbar createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  int _selectedPage = 0;
  void onTabChangedListener(position) {
    setState(() {
      _selectedPage = position;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widList = [
      Bookings(),
      Services(),
      Profile(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('TurboCharm'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: widList[_selectedPage],
      )),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Bookings'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            title: Text('Services'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: onTabChangedListener,
      ),
    );
  }
}
