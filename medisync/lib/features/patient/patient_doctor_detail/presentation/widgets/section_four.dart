import 'package:flutter/material.dart';
import 'package:medisync/widgets/container/container_widget.dart';
import 'package:medisync/widgets/other/expansion_panel_widget.dart';
import '../../../../../common/constant/app_colors.dart';
import '../../../../../common/constant/app_text.dart';

Widget sectionFour(String title) {
  return ContainerWidget(
    padding: 0,
    child: ExpansionPanelWidget(
      isExpand: true,
      title: 'Practical Experience',
      children: [
        for (var index in [1, 2, 3, 4, 5, 6])
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            child: Text(
              title + index.toString(),
              style: AppText.text14.copyWith(
                color: AppColors.greyColor500,
              ),
            ),
          ),
      ],
    ),
  );
}
