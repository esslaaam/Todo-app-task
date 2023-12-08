import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/size.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String hint;
  final int maxLines;

  const CustomTextField(
      {super.key, required this.hint, this.maxLines = 1, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      cursorColor: AppColors.kPrimary,
      maxLines: maxLines,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(AppColors.kPrimary),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppRadius.r8,
        ),
        borderSide: BorderSide(
          color: color ?? AppColors.kWhite,
        ));
  }
}
