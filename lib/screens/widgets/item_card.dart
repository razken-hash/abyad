import 'package:abyad/controllers/new_order_controller.dart';
import 'package:abyad/models/clothe_item.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  final ClotheItem clotheItem;
  const ItemCard({super.key, required this.clotheItem});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 150,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            Assets.imagify(
              widget.clotheItem.name.toLowerCase(),
              directory: "${Assets.defaultImagesDirectory}/clothes",
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              color: mainColor.withOpacity(.7),
            ),
            child: Row(
              children: [
                Text(
                  widget.clotheItem.name,
                  style: const TextStyle(
                    color: white,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
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
                      text: '${widget.clotheItem.price}',
                      style: const TextStyle(
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
                '${widget.clotheItem.quantity}',
                style: const TextStyle(
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
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              color: mainColor.withOpacity(.7),
            ),
            child: Consumer<NewOrderController>(
                builder: (context, newOrderController, child) {
              return Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        newOrderController.removeItem(widget.clotheItem);
                        setState(() {
                          widget.clotheItem.quantity--;
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        color: white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: VerticalDivider(
                      thickness: 1.5,
                      width: 1.5,
                      color: white,
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        newOrderController.addItem(widget.clotheItem);

                        setState(() {
                          widget.clotheItem.quantity++;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: white,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
