import 'package:flutter/material.dart';
import 'package:medisync/widgets/container/container_widget.dart';
import 'package:medisync/widgets/other/expansion_panel_widget.dart';
import '../../../../../common/constant/app_colors.dart';
import '../../../../../common/constant/app_text.dart';

Widget sectionFive() {
  List<String> historyEducation = [
    'Master of Science in Cardiology, University ABC, 2014',
    'Bachelor of Medicine, University XYZ, 2010',
    'Doctor of Medicine, Medical College DEF, 2005',
  ];

  return ContainerWidget(
    padding: 0,
    child: ExpansionPanelWidget(
      isExpand: true,
      title: 'Educational History',
      children: [
        for (var index in historyEducation)
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            child: Text(
              index,
              style: AppText.text14.copyWith(
                color: AppColors.greyColor500,
              ),
            ),
          ),
      ],
    ),
  );
}
