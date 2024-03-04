import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:medisync/widgets/container/container_widget.dart';

import '../../../../../common/constant/app_colors.dart';
import '../../../../../common/constant/app_text.dart';

Widget sectionTwo(String description) {
  return ContainerWidget(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Profie Doctor',
          style: AppText.text16.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        ExpandableText(
          description,
          style: AppText.text14.copyWith(
            color: AppColors.blackColor,
          ),
          expandText: 'Show More',
          collapseText: 'Show less',
          maxLines: 3,
          linkColor: AppColors.primaryColor,
        ),
      ],
    ),
  );
}
