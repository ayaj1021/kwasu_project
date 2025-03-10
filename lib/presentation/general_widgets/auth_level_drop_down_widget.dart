import 'package:flutter/material.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';

class AppDropDownWidget<T> extends StatelessWidget {
  const AppDropDownWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.items,
      this.selectedItem,
      required this.itemToString,
      required this.onChanged,
      this.icon});
  final String title;
  final String hintText;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemToString;
  final Widget? icon;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                elevation: 0,
                dropdownColor: AppColors.white,
                icon: icon ??
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primaryColor,
                    ),
                hint: Text(
                  hintText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                value: selectedItem,
                isExpanded: true,
                underline: SizedBox.shrink(),
                items: items.map((T item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Text(itemToString(item)),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 20,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              title,
              style: AppTextStyles.headlineMedium.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
