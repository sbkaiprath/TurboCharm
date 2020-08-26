import 'package:flutter/material.dart';
import 'package:turbocharm/models/parts.dart';
import 'package:turbocharm/providers/user_provider.dart';

enum OrderStatus{
  pending,
  accepted,
  completed
}
 
class OrderItem {
  final String id;
  final User user;
  final List<Parts> parts;
  final DateTime dateTime;
  final double total;
  final bool isFirst;
  final OrderStatus orderStatus;

  OrderItem({
    @required this.id,
    @required this.user,
    this.isFirst = true,
    @required this.parts,
    @required this.dateTime,
    @required this.total,
    @required this.orderStatus,
  });
}
