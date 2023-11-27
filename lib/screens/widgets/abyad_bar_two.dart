import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/screens/total_screen.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AbyadBarTwo extends StatelessWidget {
  final OrderType? orderType;
  const AbyadBarTwo({super.key, this.orderType});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return SizedBox(
          height: 146,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
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
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: white,
                        child: orderType == null
                            ? const Center()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.iconify(
                                        orderType == OrderType.Ironing
                                            ? "steaming"
                                            : "laundry"),
                                    color: mainColor,
                                    width: 40,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    orderType == OrderType.Ironing
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
                                  text: const TextSpan(
                                    text: '32x ',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
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
                              text: const TextSpan(
                                text: '320 ',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 65,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'SAR',
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
  }
}
