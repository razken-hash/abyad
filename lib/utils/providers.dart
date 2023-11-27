import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/controllers/new_order_controller.dart';
import 'package:abyad/controllers/phone_controller.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<NavigationController>(
    create: (context) => NavigationController(),
  ),
  ChangeNotifierProvider<NewOrderController>(
    create: (context) => NewOrderController(),
  ),
  ChangeNotifierProvider<PhoneController>(
    create: (context) => PhoneController(),
  ),
];
