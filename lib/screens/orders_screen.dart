import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/screens/invoice_screen.dart';
import 'package:abyad/screens/widgets/abyad_icon_button.dart';
import 'package:abyad/screens/widgets/abyad_date_box.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              AbyadIconButton(
                label: "Online",
                icon: Assets.iconify("online"),
                onPressed: () {},
                color: grey,
                height: 75,
                width: 85,
              ),
              const SizedBox(width: 25),
              AbyadIconButton(
                label: "Walk-in",
                icon: Assets.iconify("shop"),
                onPressed: () {},
                color: grey,
                height: 75,
                width: 85,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView.separated(
              itemCount: 12,
              itemBuilder: (context, index) {
                return const InvoiceTile();
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
        Container(
          color: mainColor,
          height: 90,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Total: ',
                  style: TextStyle(
                    color: white,
                    fontSize: 45,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '320 ',
                      style: TextStyle(
                        fontSize: 45,
                      ),
                    ),
                    TextSpan(
                      text: 'SAR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              AbyadDateBox(
                label: "From",
                datetime: DateTime.now(),
              ),
              AbyadDateBox(
                label: "To",
                datetime: DateTime.now(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InvoiceTile extends StatelessWidget {
  const InvoiceTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<NavigationController>(context, listen: false)
            .navigateTo(const InvoiceScreen(), index: 2);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 6,
              backgroundColor: green,
            ),
            const SizedBox(width: 20),
            const Text(
              "Invoice 031123",
              style: TextStyle(
                color: green,
                fontSize: 28,
              ),
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(
              Assets.iconify("shop"),
              height: 30,
              color: mainColor,
            ),
            const Spacer(),
            const Text(
              "Not paid yet",
              style: TextStyle(
                color: green,
                fontSize: 28,
              ),
            ),
            const SizedBox(width: 20),
            Switch(
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
