import 'package:flutter/foundation.dart';
import 'package:turbocharm/providers/company_provider.dart';
import '../models/services.dart';

class ServiceProviders with ChangeNotifier {
  List<Services> _items = [
    Services(
        id: 'qwert1',
        companyItem: CompanyItem(
          companyId: 'qsdd55',
          companyName: "Karunans Limit",
          location: Location(8545, 'Chandakavera', 6566),
          companyImage:
              'https://www.smergers.com/media/businessphoto/46804-1592977306-8024aa83-c9e8-41d9-864b-7df2468653be.png',
        ),
        serviceName: 'Diesel Wash',
        servicePrice: 2500,
        serviceImageUrl:
            'https://sportscommunity.com.au/wp-content/uploads/2017/07/shutterstock_685897171.jpg')
  ];
  List<Services> get items {
    return [..._items];
  }
}
