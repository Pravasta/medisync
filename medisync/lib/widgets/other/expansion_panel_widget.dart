import 'package:flutter/material.dart';

import '../../common/constant/app_colors.dart';
import '../../common/constant/app_text.dart';

class ExpansionPanelWidget extends StatefulWidget {
  const ExpansionPanelWidget({
    super.key,
    required this.title,
    required this.children,
    this.isExpand = false,
  });

  final String title;
  final List<Widget> children;
  final bool isExpand;

  @override
  State<ExpansionPanelWidget> createState() => _ExpansionPanelWidgetState();
}

class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    isExpanded = widget.isExpand;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandIconColor: AppColors.greyColor400,
      elevation: 0,
      expandedHeaderPadding: const EdgeInsets.all(8),
      expansionCallback: (panelIndex, expand) {
        isExpanded = expand;
        setState(() {});
      },
      children: [
        ExpansionPanel(
          backgroundColor: Colors.transparent,
          headerBuilder: (context, isExpanded) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: AppText.text16.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
