import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';

class AbyadTextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final double height, width;
  final Color color;
  final double labelSize;

  const AbyadTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = mainColor,
    this.height = 45,
    this.width = 120,
    this.labelSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: white,
              fontSize: labelSize,
            ),
          ),
        ),
      ),
    );
  }
}
