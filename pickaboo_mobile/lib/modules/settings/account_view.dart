import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class AccountView extends ConsumerStatefulWidget {
  const AccountView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountViewState();
}

class _AccountViewState extends ConsumerState<AccountView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _name.text = 'Victor Osborne';
    _phone.text = '+234 700 1234 566';
    _email.text = 'victor@gmail.com';
    return Scaffold(
      appBar: customAppBar5(
        context,
        hasElevation: false,
        bgColor: AppColors.fadeGreen,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.fadeGreen,
            child: Column(
              children: [
                SizedBox(width: width(context)),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                        radius: width(context) * 0.08,
                        backgroundColor: AppColors.lightAsh,
                        child: SizedBox(
                          width: width(context) * 0.16,
                          height: width(context) * 0.16,
                          child: Image.asset('assets/images/dummy_icon.png',
                              fit: BoxFit.cover),
                        )),
                    Positioned(
                        top: width(context) * 0.12,
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            padding: const EdgeInsets.all(1.5),
                            child: Icon(
                              Icons.camera_alt,
                              size: width(context) * 0.04,
                              color: AppColors.primary,
                            )))
                  ],
                ),
                SizedBox(height: height(context) * 0.01, width: width(context)),
                Text('Home Resident',
                    style:
                        medium16(context).copyWith(color: AppColors.primary)),
                SizedBox(height: height(context) * 0.02),
              ],
            ),
          ),
          Padding(
            padding: screenPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height(context) * 0.01),
                EditableTextField(
                  label: 'Full Name',
                  controller: _name,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: height(context) * 0.01),
                EditableTextField(
                  label: 'Email Address',
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: height(context) * 0.01),
                EditableTextField(
                  label: 'Phone Number',
                  controller: _phone,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: height(context) * 0.01),
                Text(
                  'Gender',
                  style: regular14(context)
                      .copyWith(color: Colors.black.withOpacity(0.4)),
                ),
                Consumer(builder: (context, ref, child) {
                  final gender = ref.watch(genderProvider);

                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            activeColor: AppColors.primary,
                            title: Text('Male', style: medium14(context)),
                            value: 'male',
                            groupValue: gender,
                            onChanged: (newVal) {
                              ref
                                  .read(genderProvider.notifier)
                                  .updateGender(newVal ?? '');
                            }),
                      ),
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            activeColor: AppColors.primary,
                            title: Text('Female', style: medium14(context)),
                            value: 'female',
                            groupValue: gender,
                            onChanged: (newVal) {
                              ref
                                  .read(genderProvider.notifier)
                                  .updateGender(newVal ?? '');
                            }),
                      ),
                      SizedBox(width: width(context) * 0.22)
                      // Expanded(
                      //   flex: 2,
                      //   child: SizedBox())
                    ],
                  );
                }),
                SizedBox(height: height(context) * 0.05),
                AppButton(text: 'Save Changes', onPressed: () {}),
              ],
            ),
          )
        ],
      )),
    );
  }
}

final genderProvider =
    NotifierProvider<GenderNotifier, String>(GenderNotifier.new);

class GenderNotifier extends Notifier<String> {
  @override
  build() {
    return '';
  }

  void updateGender(String gender) {
    state = gender;
  }
}
