import 'dart:math';

import 'package:abyad/models/clothe_item.dart';
import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/repositories/clothes_repo.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewOrderScreen extends StatelessWidget {
  final OrderType orderType;
  const NewOrderScreen({super.key, required this.orderType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.iconify("triangle"),
                height: 33,
                color: mainColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, AbdAllah",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "User IP 031123",
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                Assets.imagify("abyad"),
                height: 70,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
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
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "966",
                              style: TextStyle(
                                color: darkGrey,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              width: 30,
                            ),
                            Text(
                              orderType == OrderType.Ironing
                                  ? "Ironing"
                                  : "Cleaning & Ironing",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 18,
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
                              fontSize: 18,
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
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '32x ',
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Items',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
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
                                fontSize: 32,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'SAR',
                                  style: TextStyle(
                                    fontSize: 15,
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
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                // 2,
                ClothesRepo.clothe_items.length ~/ 2,
                (i) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(2, (j) {
                    ClotheItem item = ClothesRepo.clothe_items[2 * i + j];
                    return Container(
                      height: 165,
                      width: 165,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.imagify(
                              item.name.toLowerCase(),
                              directory:
                                  "${Assets.defaultImagesDirectory}/clothes",
                            ),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              color: mainColor.withOpacity(.7),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 15,
                                  ),
                                ),
                                const Spacer(),
                                Transform.rotate(
                                  angle: pi,
                                  child: Divider(
                                    thickness: 4,
                                    height: 55,
                                    color: white,
                                  ),
                                ),
                                SizedBox(
                                  width: 55,
                                  child: Text(
                                    '${item.price}SAR',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 55,
                            color: mainColor.withOpacity(.7),
                            child: Center(
                              child: Text(
                                '${item.quantity}',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(20)),
                              color: mainColor.withOpacity(.7),
                            ),
                            child: Row(
                              children: [Icons.remove, Icons.add]
                                  .map(
                                    (icon) => Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          if (icon == Icons.add) {
                                            item.quantity++;
                                          } else {
                                            item.quantity--;
                                          }
                                        },
                                        child: Icon(
                                          icon,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
