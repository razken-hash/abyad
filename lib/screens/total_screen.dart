import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/screens/widgets/abyad_bar_two.dart';
import 'package:abyad/screens/widgets/abyad_button.dart';
import 'package:abyad/screens/widgets/abyad_check_box.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';

class TotalScreen extends StatelessWidget {
  const TotalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AbyadBarTwo(orderType: OrderType.CleaningIroning),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Row(
            children: [
              AbyadButton(
                label: "Print",
                icon: "printer",
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              AbyadButton(
                label: "Cancel",
                icon: "x",
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              AbyadButton(
                label: "Discount",
                icon: "printer",
                onPressed: () {},
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
