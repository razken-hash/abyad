import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbyadButton extends StatelessWidget {
  final String label, icon;
  final void Function()? onPressed;
  double height, width;
  final Color color;

  AbyadButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color = mainColor,
    this.height = 90,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              Assets.iconify(icon),
              height: 44,
            ),
            Text(
              label,
              style: const TextStyle(
                color: white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
