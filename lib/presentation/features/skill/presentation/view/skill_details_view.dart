import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/extensions/overlay_extension.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/skill/presentation/notifier/paystack_checkout_notifier.dart';
import 'package:kwasu_app/presentation/features/skill/presentation/view/skill_payment_view.dart';
import 'package:kwasu_app/presentation/general_widgets/app_send_button.dart';
import 'package:kwasu_app/utils/enums.dart';

class SkillDetailsView extends ConsumerWidget {
  const SkillDetailsView(
      {super.key,
      required this.courseCode,
      required this.courseTitle,
      required this.courseAmount});
  final String courseCode;
  final String courseTitle;
  final String courseAmount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(paystackCheckoutNotifier.select((v) => v.state.isLoading));
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      padding: EdgeInsets.all(20),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.primaryBFE7BF,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selection Details',
                style: AppTextStyles.headlineLarge,
              ),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.cancel_outlined))
            ],
          ),

          //aa0b0c79-8f21-4fbf-8153-2921909fbf82
          VerticalSpacing(20),
          Text(
            'Course code',
            style: AppTextStyles.headlineMedium.copyWith(
              fontSize: 12,
            ),
          ),
          VerticalSpacing(5),
          Text(
            courseCode,
            style: AppTextStyles.headlineLarge.copyWith(
              fontSize: 14,
            ),
          ),
          VerticalSpacing(20),
          Text(
            'Course Title',
            style: AppTextStyles.headlineMedium.copyWith(
              fontSize: 12,
            ),
          ),
          VerticalSpacing(5),
          Text(
            courseTitle,
            style: AppTextStyles.headlineLarge.copyWith(
              fontSize: 14,
            ),
          ),
          VerticalSpacing(20),
          Text(
            'Amount to be paid',
            style: AppTextStyles.headlineMedium.copyWith(
              fontSize: 12,
            ),
          ),
          VerticalSpacing(5),
          Text(
            'N $courseAmount',
            style: AppTextStyles.headlineLarge.copyWith(
              fontSize: 14,
            ),
          ),
          VerticalSpacing(25),
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: AppSendButton(
                  onTap: () {
                    ref
                        .read(paystackCheckoutNotifier.notifier)
                        .paystackCheckout(onSuccess: (message, url, reference) {
                      context.showSuccess(message: message);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SetupPayoutAccount(
                            payStackUrl: url,
                            referenceId: reference,
                          ),
                        ),
                      );
                    }, onError: (error) {
                      context.showError(message: error);
                    });
                  },
                  title: isLoading ? 'Payment loading...' : 'Make Payment'))
        ],
      ),
    );
  }
}
