import 'package:deepface_test/config/constants/app_colors.dart';
import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showVideoErrorToast(BuildContext context, String error) {
  return showTopSnackBar(
      Overlay.of(context),
      Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.primaryBlack,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: Colors.transparent,
                child: Text(error,
                    style: AppTextStyles.body14w4.copyWith(color: AppColors.accentColor)),
              ),
            ),
          ),
        ),
      ),
      animationDuration: const Duration(milliseconds: 1000),
      displayDuration: const Duration(milliseconds: 800));
}