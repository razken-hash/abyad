import 'package:abyad/screens/total_screen.dart';
import 'package:abyad/screens/widgets/abyad_bar_two.dart';
import 'package:abyad/screens/widgets/abyad_icon_button.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AbyadBarTwo(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AbyadIconButton(
              label: "Print",
              icon: Assets.iconify("printer"),
              onPressed: () {},
            ),
            AbyadIconButton(
              label: "Cancel",
              icon: Assets.iconify("printer"),
              onPressed: () {},
            ),
            AbyadIconButton(
              label: "Pieces Correct",
              icon: Assets.iconify("check"),
              onPressed: () {},
              color: mainColor,
              iconSize: 30,
              labelSize: 14,
            ),
            AbyadIconButton(
              label: "Under Cleaning",
              icon: Assets.iconify("cleaning"),
              onPressed: () {},
              color: grey,
              iconSize: 30,
              labelSize: 14,
            ),
            AbyadIconButton(
              label: "Send notification",
              icon: Assets.iconify("delivery"),
              onPressed: () {},
              color: grey,
              iconSize: 30,
              labelSize: 14,
            ),
            AbyadIconButton(
              label: "Complete",
              icon: Assets.iconify("flag"),
              onPressed: () {},
              color: grey,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView.separated(
              itemCount: 12,
              itemBuilder: (context, index) {
                return const BuyItemTile();
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 2,
                  color: grey,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
