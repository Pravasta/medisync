import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget(
      {super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.warningColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          minimumSize: const Size(100, 42),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: AppText.text16.copyWith(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
