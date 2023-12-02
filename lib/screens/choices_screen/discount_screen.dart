import 'package:abyad/screens/widgets/abyad_icon_button.dart';
import 'package:abyad/utils/assets.dart';
import 'package:flutter/material.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AbyadIconButton(
              label: "Offer",
              icon: Assets.iconify("gift"),
              iconColor: null,
              height: 170,
              width: 170,
              labelSize: 25,
              iconSize: 50,
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            AbyadIconButton(
              label: "Discount Code",
              icon: Assets.iconify("discount"),
              iconColor: null,
              height: 170,
              width: 170,
              labelSize: 25,
              iconSize: 50,
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            AbyadIconButton(
              label: "Cash Back",
              icon: Assets.iconify("cash-hand"),
              iconColor: null,
              height: 170,
              width: 170,
              labelSize: 25,
              iconSize: 50,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
