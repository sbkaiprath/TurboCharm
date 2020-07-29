import 'package:flutter/material.dart';
import '../widgets/trending_scroll_single.dart';

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: mediaQuery.size.height * 0.1,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "Trending",
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            RawMaterialButton(
              padding: EdgeInsets.all(13),
              shape: StadiumBorder(side: BorderSide(color: Colors.white38)),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                        color: Theme.of(context).indicatorColor, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (context, index) => TrendingScrollSingle(),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 0,
          color: Colors.white60,
          thickness: 0.5,
        ),
        Spacer()
      ],
    );
  }
}
