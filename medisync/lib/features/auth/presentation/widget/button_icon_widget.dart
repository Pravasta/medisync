import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_text.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.label,
    required this.icon,
    required this.onpressed,
    this.fontColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String label;
  final Widget icon;
  final Function() onpressed;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: 46,
      child: ElevatedButton.icon(
        onPressed: onpressed,
        icon: icon,
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        label: Text(
          label,
          style: AppText.text16.copyWith(
            color: fontColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
