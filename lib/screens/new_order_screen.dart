import 'dart:math';

import 'package:abyad/models/clothe_item.dart';
import 'package:abyad/models/view_models/navigation_item.dart';
import 'package:abyad/repositories/clothes_repo.dart';
import 'package:abyad/screens/widgets/abyad_bar_two.dart';
import 'package:abyad/screens/widgets/item_card.dart';
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
        AppBar(),
        AppBarTwo(orderType: orderType),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                ClothesRepo.clothe_items.length ~/ 4,
                (i) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (j) {
                    return ItemCard(
                        clotheItem: ClothesRepo.clothe_items[4 * i + j]);
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
