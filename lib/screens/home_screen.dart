import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/screens/new_order_screen.dart';
import 'package:abyad/screens/widgets/abyad_bar.dart';
import 'package:abyad/screens/widgets/abyad_button.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  onPressed: () {
                    navigationController.navigateTo(
                        const NewOrderScreen(
                          orderType: OrderType.Ironing,
                        ),
                        index: 1);
                  },
                ),
                AbyadButton(
                  label: "Ironing & Cleaning",
                  icon: "laundry",
                  height: 170,
                  width: 170,
                  onPressed: () {
                    navigationController.navigateTo(
                        const NewOrderScreen(
                          orderType: OrderType.CleaningIroning,
                        ),
                        index: 1);
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
