import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/controllers/new_order_controller.dart';
import 'package:abyad/models/order.dart';
import 'package:abyad/screens/widgets/abyad_button.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 80),
          height: 90,
          width: double.infinity,
          color: white,
        ),
        Consumer<NavigationController>(
          builder: (context, navigationController, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AbyadButton(
                  label: "Ironing",
                  icon: "steaming",
                  height: 170,
                  width: 170,
                  labelSize: 25,
                  iconSize: 50,
                  color: grey,
                  onPressed: () {
                    Provider.of<NewOrderController>(context, listen: false)
                        .changeOrderType(OrderType.Ironing);
                    navigationController.navigateTo(
                      navigationController.screens[1],
                      index: 1,
                    );
                  },
                ),
                const SizedBox(width: 20),
                AbyadButton(
                  label: "Ironing & Cleaning",
                  icon: "laundry",
                  height: 170,
                  width: 170,
                  iconSize: 50,
                  labelSize: 25,
                  onPressed: () {
                    Provider.of<NewOrderController>(context, listen: false)
                        .changeOrderType(OrderType.CleaningIroning);
                    navigationController.navigateTo(
                      navigationController.screens[1],
                      index: 1,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
