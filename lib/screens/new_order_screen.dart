import 'package:abyad/controllers/new_order_controller.dart';
import 'package:abyad/models/order.dart';
import 'package:abyad/screens/widgets/abyad_bar_two.dart';
import 'package:abyad/screens/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NewOrderController>(
        builder: (context, newOrderController, child) {
      return Column(
        children: [
          const AbyadBarTwo(),
          Expanded(
            child: SingleChildScrollView(
              child: Builder(builder: (context) {
                List<LibasOrder> libasOrders = newOrderController.libasOrders;

                return Column(
                  children: List.generate(
                    libasOrders.length ~/ 4,
                    (i) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (j) {
                        return ItemCard(
                          libasOrder: libasOrders[4 * i + j],
                        );
                      }),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      );
    });
  }
}
