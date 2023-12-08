import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/size.dart';

class ColorItem extends StatelessWidget {
  final void Function() onTap;

  final bool isActive;
  final Color color;

  const ColorItem(
      {super.key,
      required this.isActive,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: AppRadius.r38,
                backgroundColor: color,
              ),
              const Icon(Icons.check, color: AppColors.kBlack, size: k30)
            ],
          )
        : GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: AppRadius.r38,
              backgroundColor: color,
            ),
          );
  }
}
