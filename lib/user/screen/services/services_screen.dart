import 'package:flutter/material.dart';
import './service_item.dart';

class ServicesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white54,
                      filled: true,
                      hintText: 'Services,Items,Products'),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              alignment: Alignment.center,
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white70,
                  ),
                  onPressed: () {}),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          children: [
            Container(
              child: Divider(
                indent: 7,
                endIndent: 7,
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Text(
              'AVAILABLE SERVICES',
              style: TextStyle(color: Colors.white70),
            ),
            Container(
              child: Divider(
                indent: 7,
                endIndent: 0,
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Expanded(
          child: ServiceItem(),
        )
      ],
    );
  }
}
