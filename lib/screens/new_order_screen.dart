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
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    "User IP 031123",
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 21,
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                ClothesRepo.clothe_items.length ~/ 4,
                (i) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (j) {
                    ClotheItem item = ClothesRepo.clothe_items[4 * i + j];
                    return Container(
                      height: 175,
                      width: 150,
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
                            height: 35,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 5),
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
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: VerticalDivider(
                                    thickness: 1.5,
                                    width: 1.5,
                                    color: white,
                                  ),
                                ),
                                SizedBox(
                                  width: 53.5,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: '${item.price}',
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 20,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: 'SAR',
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
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
                            height: 35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(20)),
                              color: mainColor.withOpacity(.7),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      item.quantity++;
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: VerticalDivider(
                                    thickness: 1.5,
                                    width: 1.5,
                                    color: white,
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      item.quantity++;
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
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
