import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/home/presentation/view/drawer_view.dart';
import 'package:kwasu_app/presentation/features/receipts/presentation/widgets/receipt_widget.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:kwasu_app/presentation/general_widgets/search_bar_widget.dart';

class ReceiptView extends ConsumerStatefulWidget {
  const ReceiptView({super.key});
  static const String routeName = '/receiptView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends ConsumerState<ReceiptView> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //  ref.read(getAllSkillsNotifier.notifier).getAllSkills();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(getUserDetailsNotifier.select((v) => v.data));
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: DrawerView(),
      ),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        userName: '${userName?.firstName} ${userName?.lastName}',
        userLevel: '${userName?.level} lvl',
        userCourse: '',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Course Receipts',
                // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                style: AppTextStyles.headlineLarge
                    .copyWith(color: AppColors.primaryColor),
              ),
              VerticalSpacing(15),
              SearchBarWidget(
                  hintText: 'Select course code',
                  searchController: _searchController,
                  onChanged: (query) {
                    // setState(() {
                    //   _searchQuery = query.toLowerCase();
                    // });
                  }),
              VerticalSpacing(24),
              Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ReceiptWidget(),
                            VerticalSpacing(16),
                          ],
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
