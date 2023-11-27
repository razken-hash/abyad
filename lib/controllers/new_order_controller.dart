// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:abyad/models/order.dart';

class NewOrderController extends ChangeNotifier {
  late OrderType currentOrderType;
  Order order = Order.empty();

  NewOrderController() {
    currentOrderType = OrderType.CleaningIroning;
  }

  void updatePhoneNumber(String phoneNumber) {
    order.phoneNumber = phoneNumber;
    notifyListeners();
  }

  void changeOrderType(OrderType orderType) {
    if (currentOrderType != orderType) {
      currentOrderType = orderType;
      notifyListeners();
    }
  }
}
