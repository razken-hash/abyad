import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';

class AbyadDateBox extends StatelessWidget {
  final String label;
  final DateTime datetime;
  const AbyadDateBox({super.key, required this.label, required this.datetime});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: white),
          color: mainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: white,
                fontSize: 15,
              ),
            ),
            const Text(
              // datetime.format(),
              "23. 11 .23",
              style: TextStyle(
                color: white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
