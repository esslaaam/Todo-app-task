import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/size.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isLoading;

  const CustomButton({super.key, this.onTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width(context),
        height: height(context) * 0.06,
        decoration: BoxDecoration(
            color: AppColors.kPrimary,
            borderRadius: BorderRadius.circular(AppRadius.r8)),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: height(context) * 0.025,
                  width: width(context) * 0.025,
                  child: const CircularProgressIndicator(
                    color: AppColors.kBlack,
                  ),
                )
              : Text(
                  'Add',
                  style: TextStyle(
                    color: AppColors.kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFonts.t20,
                  ),
                ),
        ),
      ),
    );
  }
}
