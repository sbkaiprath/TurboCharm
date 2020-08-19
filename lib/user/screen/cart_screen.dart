import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
        ),
        Icon(
          Icons.remove_shopping_cart,
          size: 30,
        )
      ],
    );
  }
}
