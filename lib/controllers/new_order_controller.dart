// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abyad/models/clothe_item.dart';
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

  void addItem(ClotheItem item) {
    order.clothes.add(item);
    notifyListeners();
  }

  void removeItem(ClotheItem item) {
    order.clothes.remove(item);
    notifyListeners();
  }
}
