import 'package:abyad/screens/widgets/abyad_bar_two.dart';
import 'package:abyad/screens/widgets/abyad_icon_button.dart';
import 'package:abyad/screens/widgets/abyad_check_box.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';

class TotalScreen extends StatelessWidget {
  const TotalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AbyadBarTwo(
          showOrderType: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Row(
            children: [
              AbyadIconButton(
                label: "Print",
                icon: Assets.iconify("printer"),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              AbyadIconButton(
                label: "Cancel",
                icon: Assets.iconify("x"),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              AbyadIconButton(
                label: "Discount",
                icon: Assets.iconify("printer"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Colors.transparent,
                      );
                    },
                  );
                },
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 54,
                width: 64,
                child: const Icon(
                  Icons.add,
                  color: white,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 54,
                width: 64,
                child: const Icon(
                  Icons.remove,
                  color: white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.filled(
                12,
                BuyItemTile(
                  onSelect: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BuyItemTile extends StatelessWidget {
  final Function? onSelect;
  const BuyItemTile({
    super.key,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
      child: Row(
        children: [
          if (onSelect != null)
            AbyadCheckBox(value: true, onChanged: (value) {}),
          if (onSelect != null) const SizedBox(width: 10),
          const Text(
            "1 x Thobe",
            style: TextStyle(
              fontSize: 28,
              color: darkGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Text(
            "Ironing",
            style: TextStyle(
              fontSize: 28,
              color: darkGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Text(
            "3.00 SAR",
            style: TextStyle(
              fontSize: 28,
              color: darkGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
