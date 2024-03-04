import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.child,
    this.padding = 12,
  });

  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: AppColors.greyColor300!,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 11),
          ),
        ],
      ),
      child: child,
    );
  }
}
