import 'package:flutter/material.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: isOn,
        onChanged: (val) {
          setState(() {
            isOn = val;
          });
        },
        activeColor: Colors.white,
        activeTrackColor: AppColors.mainpink,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey,
      ),
    );
  }
}
