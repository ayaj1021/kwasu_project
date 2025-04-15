import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwasu_app/core/theme/app_text.dart';
import 'package:kwasu_app/core/theme/colors.dart';
import 'package:kwasu_app/core/utils/spacing.dart';
import 'package:kwasu_app/presentation/features/home/presentation/notifier/get_user_details_notifier.dart';
import 'package:kwasu_app/presentation/features/home/presentation/view/drawer_view.dart';
import 'package:kwasu_app/presentation/general_widgets/custom_app_bar.dart';
import 'package:kwasu_app/presentation/general_widgets/text_field_widget.dart';
import 'package:kwasu_app/services/data_storage.dart';
import 'package:kwasu_app/utils/image_picker.dart';

class CacView extends ConsumerStatefulWidget {
  const CacView({super.key});
  static const String routeName = '/cacView';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CacViewState();
}

class _CacViewState extends ConsumerState<CacView> {
  final ValueNotifier<bool> _isCacEnabled = ValueNotifier(false);
  late TextEditingController _emailController;

  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _matricNumberController;
  late TextEditingController _businessNatureController;
  late TextEditingController _businessDescriptionController;
  late TextEditingController _businessLocationController;

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _matricNumberController.dispose();
    _businessNatureController.dispose();
    _businessDescriptionController.dispose();
    _businessLocationController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getUserDetails();
    });
    _emailController = TextEditingController()..addListener(_validateInput);
    _fullNameController = TextEditingController()..addListener(_validateInput);
    _phoneNumberController = TextEditingController()
      ..addListener(_validateInput);
    _matricNumberController = TextEditingController()
      ..addListener(_validateInput);
    _businessNatureController = TextEditingController()
      ..addListener(_validateInput);
    _businessDescriptionController = TextEditingController()
      ..addListener(_validateInput);
    _businessLocationController = TextEditingController()
      ..addListener(_validateInput);

    super.initState();
  }

  void _validateInput() {
    _isCacEnabled.value = _emailController.text.isNotEmpty &&
        _fullNameController.text.isNotEmpty &&
        _matricNumberController.text.isNotEmpty &&
        _businessNatureController.text.isNotEmpty &&
        _businessDescriptionController.text.isNotEmpty &&
        _businessLocationController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty;
  }

  getUserDetails() async {
    final userId = await SecureStorageService().readUserId();
    await ref
        .read(getUserDetailsNotifier.notifier)
        .getUserDetails(id: '$userId');
  }

  File? _selectedImage;
  Future<void> _pickImage() async {
    final rightImage =
        await ImagePickerHelper.pickAndSaveImage(source: ImageSource.gallery);
    if (rightImage != null) {
      setState(() {
        _selectedImage = rightImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(getUserDetailsNotifier.select((v) => v.data));
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: DrawerView(),
      ),
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        userName: '${userName?.firstName ?? ''} ${userName?.lastName ?? ''}',
        userLevel: '${userName?.level ?? ''} lvl',
        userCourse: '',
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CAC Registration',
                style: AppTextStyles.headlineLarge.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              VerticalSpacing(15),
              AppTextFieldWidget(
                controller: _fullNameController,
                title: 'Full Name',
                hintText: 'Olusanmi  Pelumi',
              ),
              VerticalSpacing(12),
              AppTextFieldWidget(
                controller: _emailController,
                title: 'Email Address',
                hintText: 'Joshuasangbeto@gmail.com',
              ),
              VerticalSpacing(12),
              AppTextFieldWidget(
                controller: _fullNameController,
                title: 'Date of Birth',
                hintText: 'DD/MM/YYYY',
              ),
              VerticalSpacing(12),
              AppTextFieldWidget(
                controller: _phoneNumberController,
                title: 'Phone number',
                hintText: '09012345678',
              ),
              VerticalSpacing(12),
              AppTextFieldWidget(
                controller: _matricNumberController,
                title: 'Matric Number',
                hintText: 'Kwasu/bio/218',
              ),
              VerticalSpacing(12),
              AppTextFieldWidget(
                controller: _businessNatureController,
                title: 'Nature of proposed Business',
                hintText: '',
              ),
              VerticalSpacing(12),
              AppTextFieldWidget(
                controller: _businessDescriptionController,
                title: 'Description of Proposed Business',
                hintText: '',
              ),
              VerticalSpacing(12),
              AppTextFieldWidget(
                controller: _businessLocationController,
                title: 'Location of Business',
                hintText: '9.i keja avenue',
              ),
              VerticalSpacing(20),
              Text(
                'Document Upload',
                style: AppTextStyles.headlineLarge.copyWith(
                  color: AppColors.primary474747,
                ),
              ),
              VerticalSpacing(13),
              GestureDetector(
                onTap: () => _pickImage(),
                child: Container(
                  height: MediaQuery.sizeOf(context).width * 0.3,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: AppColors.primary58AE58, width: 0.7),
                      color: AppColors.primaryD7ECD7),
                  child: _selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/upload.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                                Text(
                                  'Browse ',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 12),
                                ),
                                Text(
                                  'to upload your file',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                      color: AppColors.black, fontSize: 12),
                                )
                              ],
                            ),
                            Text('Max 3MB'),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
