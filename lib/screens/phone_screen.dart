import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/controllers/new_order_controller.dart';
import 'package:abyad/controllers/phone_controller.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneController>(
        builder: (context, phoneController, child) {
      return Column(
        children: [
          Text(
            phoneController.fullPhoneNumber,
            style: const TextStyle(
              color: darkGrey,
              fontSize: 45,
            ),
          ),
          ...List.generate(
            3,
            (i) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (j) => InkWell(
                  onTap: () {
                    phoneController.addCharacter("${i * 3 + j + 1}");
                  },
                  child: keyboardButton(number: i * 3 + j + 1),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 90),
              InkWell(
                onTap: () {
                  phoneController.addCharacter("0");
                },
                child: keyboardButton(number: 0),
              ),
              InkWell(
                onTap: () {
                  phoneController.removeCharacter();
                },
                onLongPress: () {
                  phoneController.clearNumber();
                },
                child: Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.iconify("x"),
                      height: 25,
                      color: darkGrey,
                    ),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Provider.of<NavigationController>(context, listen: false)
                        .navigateTo(
                      Provider.of<NavigationController>(context, listen: false)
                          .screens[1],
                      index: 1,
                    );
                  },
                  child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      color: grey,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: white,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            color: white,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Provider.of<NewOrderController>(context, listen: false)
                        .updatePhoneNumber(
                      phoneController.phoneNumber,
                    );
                    Provider.of<NavigationController>(context, listen: false)
                        .navigateTo(
                      Provider.of<NavigationController>(context, listen: false)
                          .screens[1],
                      index: 1,
                    );
                  },
                  child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      color: mainColor,
                    ),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    });
  }

  Widget keyboardButton({required int number}) {
    return Container(
      height: 80,
      width: 80,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        color: white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$number",
          style: const TextStyle(
            color: darkGrey,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
