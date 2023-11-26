import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbyadBar extends StatelessWidget {
  const AbyadBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.iconify("triangle"),
            height: 33,
            color: mainColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, AbdAllah",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 35,
                ),
              ),
              Text(
                "User IP 031123",
                style: TextStyle(
                  color: darkGrey,
                  fontSize: 21,
                ),
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            Assets.imagify("abyad"),
            height: 70,
          ),
        ],
      ),
    );
  }
}
