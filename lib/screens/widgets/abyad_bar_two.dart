import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbyadBarTwo extends StatelessWidget {
  final OrderType orderType;
  const AbyadBarTwo({super.key, required this.orderType});

  @override
  Widget build(BuildContext context) {
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
                        Text(
                          "966",
                          style: TextStyle(
                            color: darkGrey,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.iconify(orderType == OrderType.Ironing
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
                          style: TextStyle(
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
                      Text(
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
                          Text(
                            "Total",
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '32x ',
                              style: TextStyle(
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
                          text: '320 ',
                          style: TextStyle(
                            color: white,
                            fontSize: 65,
                          ),
                          children: const <TextSpan>[
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
        ],
      ),
    );
  }
}
