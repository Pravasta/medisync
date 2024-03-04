import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';

class PatientProfileListWidget extends StatelessWidget {
  const PatientProfileListWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
  });

  final String label;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppText.text16.copyWith(
                  color: AppColors.greyColor500,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Icon(
              icon,
              size: 20,
              color: AppColors.greyColor400,
            ),
          ],
        ),
      ),
    );
  }
}
