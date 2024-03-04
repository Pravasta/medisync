import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';

class CustomSelectButtonWidget extends StatefulWidget {
  const CustomSelectButtonWidget({
    super.key,
    required this.data,
    this.value,
  });

  final List<Map<String, dynamic>> data;
  final String? value;

  @override
  State<CustomSelectButtonWidget> createState() =>
      _CustomSelectButtonWidgetState();
}

class _CustomSelectButtonWidgetState extends State<CustomSelectButtonWidget> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (var item in widget.data) {
      items.add(Map.from(item));
      if (items.last["value"] == widget.value) {
        items.last["checked"] = true;
      }
    }
  }

  setAllItemsToFalse() {
    for (var item in items) {
      item["checked"] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        items.length,
        (int index) {
          var item = items[index];
          bool selected = item["checked"] == true;
          return Expanded(
            child: InkWell(
              onTap: () {
                setAllItemsToFalse();
                item["checked"] = true;
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:
                      selected ? AppColors.primaryColor : AppColors.whiteColor,
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyColor300!,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.data[index]['gender'],
                    style: AppText.text14.copyWith(
                      color: selected
                          ? AppColors.whiteColor
                          : AppColors.greyColor400,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
