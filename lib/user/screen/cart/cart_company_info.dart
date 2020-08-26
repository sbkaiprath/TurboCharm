import 'package:flutter/material.dart';
import 'package:turbocharm/providers/company_provider.dart';

class CartCompanyInfo extends StatelessWidget {
  const CartCompanyInfo({
    Key key,
    @required this.company,
  }) : super(key: key);

  final CompanyItem company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: null,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              child: Image.network(
                company.companyImage,
                fit: BoxFit.fill,
              ),
              height: 80,
              width: 90,
            ),
          ),
          title: Text(
            company.companyName.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            company.location.locationName +
                ' | ' +
                company.parts.car.brand +
                ' ' +
                company.parts.car.carName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 2,
        )
      ],
    );
  }
}
