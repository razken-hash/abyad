import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/controllers/new_order_controller.dart';
import 'package:abyad/models/order.dart';
import 'package:abyad/screens/choices_screen/alert_screen.dart';
import 'package:abyad/screens/widgets/abyad_icon_button.dart';
import 'package:abyad/utils/assets.dart';
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
                AbyadIconButton(
                  label: "Ironing",
                  icon: Assets.iconify("steaming"),
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
                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) => AlertDialog(
                    //     content: CancelOrderScreen(),
                    //   ),
                    // );
                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: true,
                    //   builder: (context) => const DiscountScreen(),
                    // );
                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: true,
                    //   builder: (context) => const ChangePaymentMethodScreen(),
                    // );

                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: true,
                    //   builder: (context) => const AlertDialog(
                    //     content: AlertScreen(
                    //       alertMessage: "This discount code is not correct",
                    //     ),
                    //   ),
                    // );
                  },
                ),
                const SizedBox(width: 20),
                AbyadIconButton(
                  label: "Ironing & Cleaning",
                  icon: Assets.iconify("laundry"),
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
