// import 'dart:io';
// import 'package:go_router/go_router.dart';
// import 'package:pickaboo_mobile/utilities/image_selector.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../controllers/auth/auth_controller.dart';
// import '../../utilities/utilities.dart';
// import '../../widgets/widgets.dart';

// class AccountView extends ConsumerStatefulWidget {
//   const AccountView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AccountViewState();
// }

// class _AccountViewState extends ConsumerState<AccountView> {
//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _phone = TextEditingController();
//   final TextEditingController _firstName = TextEditingController();
//   final TextEditingController _address = TextEditingController();
//   final TextEditingController _middleName = TextEditingController();
//   final TextEditingController _lastName = TextEditingController();
//   final TextEditingController _dob = TextEditingController();
//   final TextEditingController _zone = TextEditingController();
//   final TextEditingController _phone2 = TextEditingController();
//   final TextEditingController _buildingInformation = TextEditingController();
//   final TextEditingController _streetName = TextEditingController();
//   final TextEditingController _townCity = TextEditingController();

//   @override
//   void dispose() {
//     _name.dispose();
//     _email.dispose();
//     _phone.dispose();
//     _address.dispose();
//     _firstName.dispose();
//     _middleName.dispose();
//     _lastName.dispose();
//     _dob.dispose();
//     super.dispose();
//   }

//   File? pickedFile;

//   void updateImage(File chosenFile) {
//     pickedFile = chosenFile;
//     if (pickedFile == null) {
//       return;
//     }
//     ref.read(authProvider.notifier).updateProfilePhoto(
//         ref: ref, context: context, pickedFile: pickedFile!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = ref.watch(authProvider).user;
//     //final isVerified = user!.isVerified;
//     //_name.text = '${user?.firstName ?? ''} ${user?.lastName ?? ''} ';
//     _firstName.text = user!.firstName ?? '';
//     _phone.text = user.phone ?? '';
//     _email.text = user.email ?? '';
//     _address.text = user.address ?? '';
//     _middleName.text = user.middleName ?? '';
//     _lastName.text = user.lastName ?? '';
//     _dob.text = user.dob ?? '';
//     _zone.text = user.zone?.name ?? '';
//     _phone2.text = user.phone2 ?? '';
//     _buildingInformation.text = user.buildingInformation!.houseNumber ?? '';
//     _streetName.text = user.buildingInformation!.streetName ?? '';
//     _townCity.text = user.buildingInformation?.townCity ?? '';

//     return Scaffold(
//       appBar: customAppBar5(
//         actions: [
//           // Visibility(
//           //   visible: !isVerified!, // Show the button only if isVerified is false
//           //   child:
//           TextButton(
//             onPressed: () {
//               context.pushNamed(
//                 AppRouter.editUserProfile,
//               );
//                setState(() {});
//             },
//             child: const Text(
//               "EDIT",
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.primary,
//               ),
//             ),
//           ),
//         ],
//         context,
//         hasElevation: false,
//         bgColor: AppColors.fadeGreen,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: AppColors.fadeGreen,
//               child: Column(
//                 children: [
//                   SizedBox(width: width(context)),
//                   ImageSelector(
//                       imgUrl: user.avatar ?? '',
//                       updateImage: updateImage,
//                       name: user.firstName),
//                   SizedBox(
//                       height: height(context) * 0.01, width: width(context)),
//                   Text('Home Resident',
//                       style:
//                           medium16(context).copyWith(color: AppColors.primary)),
//                   SizedBox(height: height(context) * 0.02),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: screenPadding(context),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'First Name',
//                     controller: _firstName,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'Middle Name',
//                     controller: _middleName,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'Last Name',
//                     controller: _lastName,
//                     keyboardType: TextInputType.name,
//                   ),
//                   EditableTextField(
//                     label: 'Email Address',
//                     controller: _email,
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'Primary Phone Number',
//                     controller: _phone,
//                     keyboardType: TextInputType.phone,
//                   ),
//                   EditableTextField(
//                     label: 'Secondary Phone Number',
//                     controller: _phone2,
//                     keyboardType: TextInputType.phone,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'Address',
//                     controller: _address,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'Date of Birth',
//                     controller: _dob,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'Zone',
//                     controller: _streetName,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'City',
//                     controller: _townCity,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'Zone',
//                     controller: _zone,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   EditableTextField(
//                     label: 'House Number',
//                     controller: _buildingInformation,
//                     keyboardType: TextInputType.name,
//                   ),
//                   SizedBox(height: height(context) * 0.01),
//                   Text(
//                     'Gender',
//                     style: regular14(context)
//                         .copyWith(color: Colors.black.withOpacity(0.4)),
//                   ),
//                   Consumer(builder: (context, ref, child) {
//                     final gender = ref.watch(
//                         genderProvider(user.gender?.toLowerCase() ?? ''));

//                     return Row(
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: RadioListTile(
//                               contentPadding: EdgeInsets.zero,
//                               activeColor: AppColors.primary,
//                               title: Text('Male', style: medium14(context)),
//                               value: 'male',
//                               groupValue: gender,
//                               onChanged: (String? newVal) {}),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: RadioListTile(
//                               contentPadding: EdgeInsets.zero,
//                               activeColor: AppColors.primary,
//                               title: Text('Female', style: medium14(context)),
//                               value: 'female',
//                               groupValue: gender,
//                               onChanged: (String? newVal) {}),
//                         ),
//                         SizedBox(width: width(context) * 0.22)
//                       ],
//                     );
//                   }),
//                   SizedBox(height: height(context) * 0.05),
//                   // AppButton(
//                   //     text: 'Save Changes',
//                   //     onPressed: () {
//                   //
//                   //     }),
//                 ],
//               ),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

// final genderProvider =
//     NotifierProviderFamily<GenderNotifier, String, String>(GenderNotifier.new);

// class GenderNotifier extends FamilyNotifier<String, String> {
//   @override
//   build(String arg) {
//     return arg;
//   }

//   void updateGender(String gender) {
//     state = gender;
//   }
// }

import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:pickaboo_mobile/utilities/image_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth/auth_controller.dart';
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
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _zone = TextEditingController();
  final TextEditingController _phone2 = TextEditingController();
  final TextEditingController _buildingInformation = TextEditingController();
  final TextEditingController _streetName = TextEditingController();
  final TextEditingController _townCity = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _address.dispose();
    _firstName.dispose();
    _middleName.dispose();
    _lastName.dispose();
    _dob.dispose();
    super.dispose();
  }

  File? pickedFile;

  void updateImage(File chosenFile) {
    pickedFile = chosenFile;
    if (pickedFile == null) {
      return;
    }
    ref.read(authProvider.notifier).updateProfilePhoto(
        ref: ref, context: context, pickedFile: pickedFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar5(
        actions: [
          TextButton(
            onPressed: () async {
              await context.pushNamed(
                AppRouter.editUserProfile,
              );
              
            },
            child: const Text(
              "EDIT",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
        context,
        hasElevation: false,
        bgColor: AppColors.fadeGreen,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer(
            builder: (context, ref, child) {
              final user = ref.watch(authProvider.notifier).user;
             final _accountType = user?.accountType ?? '';
              _firstName.text = user?.firstName ?? '';
              _phone.text = user?.phone ?? '';
              _email.text = user?.email ?? '';
              _address.text = user?.address ?? '';
              _middleName.text = user?.middleName ?? '';
              _lastName.text = user?.lastName ?? '';
              _dob.text = user?.dob ?? '';
              _zone.text = user?.zone?.name ?? '';
              _phone2.text = user?.phone2 ?? '';
              _buildingInformation.text =
                  user?.buildingInformation?.houseNumber ?? '';
              _streetName.text = user?.buildingInformation?.streetName ?? '';
              _townCity.text = user?.buildingInformation?.townCity ?? '';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.fadeGreen,
                    child: Column(
                      children: [
                        SizedBox(width: width(context)),
                        ImageSelector(
                          imgUrl: user?.avatar ?? '',
                          updateImage: updateImage,
                          name: user?.firstName ?? '',
                        ),
                        SizedBox(
                          height: height(context) * 0.01,
                          width: width(context),
                        ),
                        Text(
                          _accountType == 'Service Personnel'
                              ? 'Service Personel'
                              : _accountType == 'Home Resident'
                                  ? 'Home Resident'
                                  : 'Unknown Account Type',
                          style: medium16(context).copyWith(
                            color: AppColors.primary,
                          ),
                        ),

                        SizedBox(height: height(context) * 0.02),
                      ],
                    ),
                  ),
                  Padding(
                    padding: screenPadding(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditableTextField(
                          label: 'First Name',
                          controller: _firstName,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'Middle Name',
                          controller: _middleName,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'Last Name',
                          controller: _lastName,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'Email Address',
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        EditableTextField(
                          label: 'Primary Phone Number',
                          controller: _phone,
                          keyboardType: TextInputType.phone,
                        ),
                        EditableTextField(
                          label: 'Secondary Phone Number',
                          controller: _phone2,
                          keyboardType: TextInputType.phone,
                        ),
                        EditableTextField(
                          label: 'Address',
                          controller: _address,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'Date of Birth',
                          controller: _dob,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'Zone',
                          controller: _streetName,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'City',
                          controller: _townCity,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'Zone',
                          controller: _zone,
                          keyboardType: TextInputType.name,
                        ),
                        EditableTextField(
                          label: 'House Number',
                          controller: _buildingInformation,
                          keyboardType: TextInputType.name,
                        ),
                        Text(
                          'Gender',
                          style: regular14(context)
                              .copyWith(color: Colors.black.withOpacity(0.4)),
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final gender = ref.watch(genderProvider(
                                user?.gender?.toLowerCase() ?? ''));

                            return Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    activeColor: AppColors.primary,
                                    title:
                                        Text('Male', style: medium14(context)),
                                    value: 'male',
                                    groupValue: gender,
                                    onChanged: (String? newVal) {},
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    activeColor: AppColors.primary,
                                    title: Text('Female',
                                        style: medium14(context)),
                                    value: 'female',
                                    groupValue: gender,
                                    onChanged: (String? newVal) {},
                                  ),
                                ),
                                SizedBox(width: width(context) * 0.22)
                              ],
                            );
                          },
                        ),
                        SizedBox(height: height(context) * 0.05),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

final genderProvider =
    NotifierProviderFamily<GenderNotifier, String, String>(GenderNotifier.new);

class GenderNotifier extends FamilyNotifier<String, String> {
  @override
  build(String arg) {
    return arg;
  }

  void updateGender(String gender) {
    state = gender;
  }
}
