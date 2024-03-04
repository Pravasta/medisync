import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';

class StepNavigationWidget extends StatefulWidget {
  const StepNavigationWidget({
    super.key,
    required this.navigations,
    required this.children,
    this.initialIndex = 0,
  });

  final List<String> navigations;
  final List<Widget> children;
  final int initialIndex;

  @override
  State<StepNavigationWidget> createState() => _StepNavigationWidgetState();
}

class _StepNavigationWidgetState extends State<StepNavigationWidget> {
  int selectedIndex = 0;

  updateInde(int index) {
    selectedIndex = index;
    setState(() {});
  }

  double get progress {
    return (selectedIndex + 1) / widget.navigations.length;
  }

  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.whiteColor,
            child: Row(
              children: [
                const BackButton(),
                Row(
                  children: List.generate(
                    widget.navigations.length,
                    (index) {
                      var navigationName = widget.navigations[index];
                      bool selected = selectedIndex == index;
                      return Row(
                        children: [
                          if (selected) ...[
                            CircleAvatar(
                              radius: 11,
                              backgroundColor: AppColors.greyColor500,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: AppColors.whiteColor,
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: AppText.text12.copyWith(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              navigationName,
                              style: AppText.text14.copyWith(
                                color: AppColors.greyColor500,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          if (!selected)
                            InkWell(
                              onTap: () {
                                if (index == 0) {
                                  Navigator.pop(context);
                                }
                                updateInde(index);
                              },
                              child: const Icon(
                                Icons.check_circle,
                                size: 24,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          if (index < widget.navigations.length - 1)
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 15,
                              height: 2,
                              color: AppColors.greyColor300,
                            ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.greyColor200!),
            height: 5,
            width: double.infinity,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: MediaQuery.of(context).size.width * progress,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfffe9039),
                        Color(0xfff2586a),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}
