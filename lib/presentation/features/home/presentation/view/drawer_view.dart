import 'package:flutter/material.dart';
import 'package:kwasu_app/core/extensions/navigation.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/assignments/presentation/view/assignment_view.dart';
import 'package:kwasu_app/presentation/features/receipts/presentation/view/receipt_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.cancel_outlined),
            ),
          ),
          DrawerOptionsWidget(
            title: 'Assignments',
            onTap: () => context.pushNamed(AssignmentView.routeName),
          ),
          VerticalSpacing(5),
          DrawerOptionsWidget(
            title: 'Receipts',
            onTap: () => context.pushNamed(ReceiptView.routeName),
          ),
          // VerticalSpacing(5),
          // DrawerOptionsWidget(
          //   title: 'CAC Registration',
          //   onTap: () => context.pushNamed(CacView.routeName),
          // ),
          VerticalSpacing(5),
          DrawerOptionsWidget(
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}

class DrawerOptionsWidget extends StatelessWidget {
  const DrawerOptionsWidget({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: AppTextStyles.headlineMedium.copyWith(
                  //   fontSize: 12,
                  ),
            ),
          ),
          // VerticalSpacing(10),
          Divider(
            color: AppColors.primaryD4D4D4,
          )
        ],
      ),
    );
  }
}
