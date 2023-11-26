import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/screens/new_order_screen.dart';
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
        AppBar(),
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
              InkWell(
                onTap: () {
                  navigationController.navigateTo(
                      const NewOrderScreen(
                        orderType: OrderType.Ironing,
                      ),
                      index: 1);
                },
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.iconify("steaming"),
                        color: white,
                        height: 60,
                      ),
                      Text(
                        "Ironing",
                        style: TextStyle(
                          color: white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(
                      const NewOrderScreen(
                        orderType: OrderType.CleaningIroning,
                      ),
                      index: 1);
                },
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: mainColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.iconify("laundry"),
                        color: white,
                        height: 75,
                      ),
                      Text(
                        "Ironing & Cleaning",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
