import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbyadIconButton extends StatelessWidget {
  final String label, icon;
  final void Function()? onPressed;
  final double height, width;
  final Color color;
  final Color? iconColor;
  final double iconSize, labelSize;

  const AbyadIconButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color = mainColor,
    this.iconColor = white,
    this.height = 90,
    this.width = 100,
    this.labelSize = 17,
    this.iconSize = 40,
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
              icon,
              height: iconSize,
              color: iconColor,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white,
                fontSize: labelSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
