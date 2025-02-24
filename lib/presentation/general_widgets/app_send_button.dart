import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';

class AppSendButton extends StatefulWidget {
  const AppSendButton({
    required this.onTap,
    required this.title,
    super.key,
    this.isEnabled = true,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.primaryFAFAFA,
    this.hasBorder = false,
    this.isLoading = false,
    this.width = double.infinity,
    this.borderColor = AppColors.primaryColor,
    this.icon,
  });

  final bool isEnabled;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final bool hasBorder;
  final String title;
  final String? icon;
  final void Function() onTap;
  final bool isLoading;
  final double width;

  @override
  State<AppSendButton> createState() => _AppSendButtonState();
}

class _AppSendButtonState extends State<AppSendButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: InkWell(
        onTap: widget.isEnabled ? widget.onTap : null,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.isEnabled
                  ? widget.backgroundColor
                  : AppColors.secondaryColor.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                widget.hasBorder
                    ? BorderSide(color: widget.borderColor)
                    : BorderSide.none,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon != null
                    ? SvgPicture.asset(widget.icon.toString())
                    : const SizedBox.shrink(),
                const HorizontalSpacing(5),
                Text(
                  widget.title,
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: widget.textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
