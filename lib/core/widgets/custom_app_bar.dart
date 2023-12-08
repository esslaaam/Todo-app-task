import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/size.dart';

import '../../features/notes/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  final bool? isShowIcon;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.icon,
      this.onPressed,
      this.isShowIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: isShowIcon == true ? height(context) * 0.005 : 0,
          start: width(context) * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppFonts.t28,
            ),
          ),
          isShowIcon == true
              ? const SizedBox.shrink()
              : CustomIcon(
                  onPressed: onPressed!,
                  icon: icon!,
                ),
        ],
      ),
    );
  }
}
