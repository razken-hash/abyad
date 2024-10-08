import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/controllers/new_order_controller.dart';
import 'package:abyad/models/order.dart';
import 'package:abyad/screens/choices_screen/change_service_screen.dart';
import 'package:abyad/screens/phone_screen.dart';
import 'package:abyad/screens/total_screen.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AbyadBarTwo extends StatelessWidget {
  final bool showOrderType;
  const AbyadBarTwo({
    super.key,
    this.showOrderType = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
        builder: (context, navigationController, child) {
      return Consumer<NewOrderController>(
        builder: (context, newOrderController, child) {
          return SizedBox(
            height: 146,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (navigationController.currentScreen.runtimeType
                                is! PhoneScreen) {
                              navigationController
                                  .navigateTo(const PhoneScreen(), index: 1);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: white,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.iconify("phone"),
                                  height: 32,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "966",
                                  style: TextStyle(
                                    color: darkGrey,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 15,
                                    color: darkGrey,
                                  ),
                                ),
                                Text(
                                  newOrderController.order.phoneNumber,
                                  style: const TextStyle(
                                    color: darkGrey,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (showOrderType) {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) =>
                                    const ChangeServiceScreen(),
                              );
                            }
                          },
                          child: Container(
                            color: white,
                            child: !showOrderType
                                ? const Center()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.iconify(newOrderController
                                                    .currentOrderType ==
                                                OrderType.Ironing
                                            ? "steaming"
                                            : "laundry"),
                                        color: mainColor,
                                        width: 40,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        newOrderController.currentOrderType ==
                                                OrderType.Ironing
                                            ? "Ironing"
                                            : "Cleaning & Ironing",
                                        style: const TextStyle(
                                          color: mainColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (navigationController.currentScreen.runtimeType
                          is! TotalScreen) {
                        navigationController.navigateTo(const TotalScreen(),
                            index: 1);
                      }
                    },
                    child: Container(
                      color: mainColor,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                Assets.iconify("shop"),
                                height: 25,
                              ),
                              const Text(
                                "Invoice 031123",
                                style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(
                                      color: darkGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${newOrderController.order.totalCount}x ',
                                      style: const TextStyle(
                                        color: white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: 'Items',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      "${newOrderController.order.totalPrice}",
                                  style: const TextStyle(
                                    color: white,
                                    fontSize: 65,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: ' SAR',
                                      style: TextStyle(
                                        fontSize: 21,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
