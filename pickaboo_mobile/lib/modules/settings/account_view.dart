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
import 'package:pickaboo_mobile/widgets/building_images.dart';

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
  //final TextEditingController _buildingInformation = TextEditingController();
  final TextEditingController _streetName = TextEditingController();
  final TextEditingController _townCity = TextEditingController();
  final TextEditingController _purposeBuiltFacility = TextEditingController();
  final TextEditingController _completionStatus = TextEditingController();
  final TextEditingController _buildingOwnerShip = TextEditingController();
  final TextEditingController _houseNumber = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _buildingImages = TextEditingController();
  final TextEditingController _noOfWasteBinNeded = TextEditingController();
  final TextEditingController _noOfResidents = TextEditingController();
  final TextEditingController _facilityIncludeSewageSystem =
      TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _facilityIncludeSewageSystem.dispose();
    _email.dispose();
    _phone.dispose();
    _phone2.dispose();
    _address.dispose();
    _firstName.dispose();
    _middleName.dispose();
    _lastName.dispose();
    _dob.dispose();
    _zone.dispose();
    _streetName.dispose();
    _townCity.dispose();
    _purposeBuiltFacility.dispose();
    _completionStatus.dispose();
    _buildingOwnerShip.dispose();
    _houseNumber.dispose();
    _area.dispose();
    _buildingImages.dispose();
    _noOfWasteBinNeded.dispose();
    _noOfResidents.dispose();
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
    final isVerified = ref.watch(authProvider).user?.isVerified;
    final editAccountType = ref.watch(authProvider).user?.accountType;
    return Scaffold(
      appBar: customAppBar5(
        actions: [
          Visibility(
            visible: !isVerified! ||
                editAccountType !=
                    "Service Personnel", // Show the button only if isVerified is false
            child: Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: AppButton(
                onPressed: () {
                  context.pushNamed(
                    AppRouter.editUserProfile,
                  );
                },
                text: "EDIT",
                buttonWidth: 0.18,
                buttonHeight: 0.04,
                buttonColor: AppColors.primary,
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
              final user = ref.watch(authProvider).user;
              final accountType = user?.accountType ?? '';
              final imagePath =
                  user?.buildingInformation?.buildingImage.toString() ?? '';
              _firstName.text = user?.firstName ?? '';
              _phone.text = user?.phone ?? '';
              _email.text = user?.email ?? '';
              _address.text = user?.address ?? '';
              _middleName.text = user?.middleName ?? '';
              _lastName.text = user?.lastName ?? '';
              _dob.text = user?.dob ?? '';
              _zone.text = user?.zone?.name ?? '';
              _phone2.text = user?.phone2 ?? '';
              _streetName.text = user?.buildingInformation?.streetName ?? '';
              _townCity.text = user?.buildingInformation?.townCity ?? '';
              _purposeBuiltFacility.text =
                  user?.buildingInformation?.commercialFacility ?? '';
              _completionStatus.text =
                  user?.buildingInformation?.completionStatus ?? '';
              _buildingOwnerShip.text =
                  user?.buildingInformation?.classification ?? '';
              _houseNumber.text = user?.buildingInformation?.houseNumber ?? '';
              _area.text = user?.buildingInformation?.area1 ?? '';
              _noOfWasteBinNeded.text =
                  user?.buildingInformation?.wasteBin ?? '';
              _buildingImages.text =
                  user?.buildingInformation?.buildingImage ?? '';
              _noOfResidents.text =
                  user?.buildingInformation?.noOfResidents ?? '';
              _facilityIncludeSewageSystem.text =
                  user?.buildingInformation?.facilityInclude ?? '';

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
                          accountType == 'Service Personnel'
                              ? 'Service Personnel'
                              : 'Home Resident',
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
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Zone',
                            controller: _streetName,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'City',
                            controller: _townCity,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Zone',
                            controller: _zone,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'House Number',
                            controller: _houseNumber,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Number Of Residents',
                            controller: _noOfResidents,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Purpose Built Facility',
                            controller: _purposeBuiltFacility,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Completion Status',
                            controller: _completionStatus,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Facility include Sewage System',
                            controller: _facilityIncludeSewageSystem,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Building Ownership',
                            controller: _buildingOwnerShip,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Area',
                            controller: _area,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: EditableTextField(
                            label: 'Number of Waste Bin Needed',
                            controller: _noOfWasteBinNeded,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: Text(
                            "Building Image",
                            style: regular14(context)
                                .copyWith(color: Colors.black.withOpacity(0.4)),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Visibility(
                          visible: accountType == 'Home Residence',
                          child: UserDetailsWidget(
                              buildingImagePath: imagePath,
                              buildingImagesController: _buildingImages),
                        ),
                        SizedBox(height: height(context) * 0.03),
                        Text(
                          'Gender',
                          style: regular14(context).copyWith(
                            color: Colors.black.withOpacity(0.4),
                          ),
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
                                    title: Text(
                                      'Male',
                                      style: medium14(context),
                                    ),
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
