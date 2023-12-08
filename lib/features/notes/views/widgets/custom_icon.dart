import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/size.dart';

class CustomIcon extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;

  const CustomIcon({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.r16),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) * 0.03,
            vertical: height(context) * 0.015),
        decoration: BoxDecoration(
            color: AppColors.kWhite.withOpacity(.05),
            borderRadius: BorderRadius.circular(AppRadius.r16)),
        child: Center(
          child: Icon(
            icon,
            size: k28,
          ),
        ),
      ),
    );
  }
}
