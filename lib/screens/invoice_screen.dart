import 'package:abyad/screens/total_screen.dart';
import 'package:abyad/screens/widgets/abyad_bar_two.dart';
import 'package:abyad/screens/widgets/abyad_button.dart';
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
            AbyadButton(
              label: "Print",
              icon: "printer",
              onPressed: () {},
            ),
            AbyadButton(
              label: "Cancel",
              icon: "printer",
              onPressed: () {},
            ),
            AbyadButton(
              label: "Pieces Correct",
              icon: "check",
              onPressed: () {},
              color: mainColor,
              iconSize: 30,
              labelSize: 14,
            ),
            AbyadButton(
              label: "Under Cleaning",
              icon: "cleaning",
              onPressed: () {},
              color: grey,
              iconSize: 30,
              labelSize: 14,
            ),
            AbyadButton(
              label: "Send notification",
              icon: "delivery",
              onPressed: () {},
              color: grey,
              iconSize: 30,
              labelSize: 14,
            ),
            AbyadButton(
              label: "Complete",
              icon: "flag",
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
