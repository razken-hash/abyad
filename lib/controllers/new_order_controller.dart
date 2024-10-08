import 'package:flutter/material.dart';

import 'package:abyad/models/order.dart';

class NewOrderController extends ChangeNotifier {
  late OrderType currentOrderType;
  Order order = Order(phoneNumber: "");

  List<LibasOrder> get libasOrders => currentOrderType == OrderType.Ironing
      ? order.ironingOrders
      : order.cleaningOrders;

  NewOrderController() {
    currentOrderType = OrderType.CleaningIroning;
    order = Order(phoneNumber: "");
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

  void addItem(LibasOrder libasOrder) {
    libasOrder.quantity++;
    notifyListeners();
  }

  void removeItem(LibasOrder libasOrder) {
    if (libasOrder.quantity > 0) {
      libasOrder.quantity--;
    }
    notifyListeners();
  }
}
