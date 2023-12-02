import 'package:abyad/screens/widgets/abyad_icon_button.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';

class ChangeServiceScreen extends StatelessWidget {
  const ChangeServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Row(
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
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            AbyadIconButton(
              label: "Ironing & Cleaning",
              icon: Assets.iconify("laundry"),
              height: 170,
              width: 170,
              iconSize: 50,
              labelSize: 25,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
