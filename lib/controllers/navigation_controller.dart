import 'dart:collection';

import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/screens/new_order_screen.dart';
import 'package:abyad/screens/orders_screen.dart';
import 'package:abyad/screens/total_screen.dart';
import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  final List<NavigationItem> _screens = [
    NavigationItem(
      screen: const TotalScreen(),
      label: "Home",
      icon: 'home',
    ),
    NavigationItem(
      screen: const NewOrderScreen(
        orderType: OrderType.CleaningIroning,
      ),
      label: "New order",
      icon: 'plus',
    ),
    NavigationItem(
      screen: const OrdersScreen(),
      label: "Orders",
      icon: 'order',
    ),
  ];

  UnmodifiableListView get screens =>
      UnmodifiableListView(_screens.map((i) => i.screen).toList().reversed);
  UnmodifiableListView get labels =>
      UnmodifiableListView(_screens.map((i) => i.label).toList().reversed);
  UnmodifiableListView get icons =>
      UnmodifiableListView(_screens.map((i) => i.icon).toList().reversed);

  late int _currentIndex;
  int get currentIndex => _currentIndex;

  late Widget currentScreen;

  NavigationController() {
    _currentIndex = 2;
    currentScreen = screens[currentIndex];
  }

  void navigateTo(Widget screen, {int? index}) {
    currentScreen = screen;
    if (index != null) {
      _currentIndex = index;
    }
    notifyListeners();
  }
}
