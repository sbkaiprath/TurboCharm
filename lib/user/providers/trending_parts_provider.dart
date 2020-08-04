import 'package:flutter/foundation.dart';
import '../models/trending_models.dart';

class TrendingModel with ChangeNotifier {
  List<TrendingModelItem> _items = [];
  List<TrendingModelItem> get items {
    return [..._items];
  }
}
