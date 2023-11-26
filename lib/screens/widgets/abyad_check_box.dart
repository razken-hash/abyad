import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';

class AbyadCheckBox extends StatefulWidget {
  final bool value;
  final Function(bool?)? onChanged;

  const AbyadCheckBox(
      {super.key, required this.value, required this.onChanged});

  @override
  State<AbyadCheckBox> createState() => _AbyadCheckBoxState();
}

class _AbyadCheckBoxState extends State<AbyadCheckBox> {
  late bool value;
  @override
  void initState() {
    super.initState();
    setState(() {
      value = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged;
      },
      child: Container(
        decoration: BoxDecoration(
          color: value ? mainColor : Colors.transparent,
          border: Border.all(
            width: 2,
            color: mainColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 30,
        width: 30,
      ),
    );
  }
}
