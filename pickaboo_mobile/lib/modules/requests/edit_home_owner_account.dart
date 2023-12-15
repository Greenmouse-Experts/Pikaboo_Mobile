import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo_mobile/controllers/auth/auth_controller.dart';
import 'package:pickaboo_mobile/data/api/api.dart';
import 'package:pickaboo_mobile/data/api/api_response.dart';
import 'package:dio/dio.dart';
import '../../data/models/models.dart';
//import 'package:pickaboo_mobile/modules/requests/request_pickup_view.dart';
import 'package:pickaboo_mobile/utilities/app_colors.dart';
import 'package:pickaboo_mobile/utilities/app_dimensions.dart';
import 'package:pickaboo_mobile/utilities/app_textstyle.dart';
import 'package:pickaboo_mobile/utilities/date_picker.dart';
import 'package:pickaboo_mobile/utilities/image_selector.dart';
import 'package:pickaboo_mobile/widgets/app_bar.dart';
import 'package:pickaboo_mobile/widgets/app_button.dart';
import 'package:pickaboo_mobile/widgets/app_text_field.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({
    super.key,
  });
  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends ConsumerState<EditProfilePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _phone2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final _api = Api();
  Future<ApiResponse> updateUserProfile(WidgetRef ref) async {
    try {
      // Prepare data for update
      final userData = FormData.fromMap({
        'email': _email.text,
        'address': _address.text,
        'first_name': _firstName.text,
        'middle_name': _middleName.text,
        'last_name': _lastName.text,
        'dob': _dob.text,
        'phone2': _phone2.text,
      });

      // Make the post request using the postData function
      final response =
          await _api.postData('/profile/update', data: userData, ref: ref);
      if (response.isSuccessful) {
        // ignore: unused_local_variable
        UserSchema updatedUser = UserSchema.fromJson(response.data);
        final userEditProvider = ref.watch(authProvider.notifier);
        //userEditProvider.setUser(updatedUser.toRawJson());
        final tempUser = userEditProvider.user;
        print("before=====${tempUser}");

        userEditProvider.user = tempUser!.copyWith(
          email: _email.text,
          address: _address.text,
          firstName: _firstName.text,
          middleName: _middleName.text,
          lastName: _lastName.text,
          dob: _dob.text,
          phone2: _phone2.text,
        );
        print("after=====${userEditProvider.user}");
        
        // _email.text = updatedUser.email!;
        // _address.text = updatedUser.address!;
        // _firstName.text = updatedUser.firstName!;
        // _middleName.text = updatedUser.middleName!;
        // _lastName.text = updatedUser.lastName!;
        // ignore: use_build_context_synchronously
      }
      // Return the ApiResponse
      return response;
    } catch (error) {
      // Handle errors here
      debugPrint('Error updating user profile: $error');
      rethrow; // Rethrow the error for further handling, or return an error ApiResponse
    }
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
    final user = ref.watch(authProvider).user;
     final _accountType = user?.accountType ?? '';
    _email.text = user?.email ?? '';
    _address.text = user?.address ?? '';
    _firstName.text = user?.firstName ?? '';
    _middleName.text = user?.middleName ?? '';
    _lastName.text = user?.lastName ?? '';
    _dob.text = user?.dob ?? '';
    _phone2.text = user?.phone2 ?? '';

    return Scaffold(
      appBar: customAppBar4(context, hasElevation: false, implyLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  color: AppColors.fadeGreen,
                  child: Column(
                    children: [
                      SizedBox(width: width(context)),
                      ImageSelector(
                          imgUrl: user?.avatar ?? '',
                          updateImage: updateImage,
                          name: user?.firstName),
                      SizedBox(
                          height: height(context) * 0.01,
                          width: width(context)),
                      Text( _accountType == 'Service Personnel'
                              ? 'Service Personel'
                              : _accountType == 'Home Resident'
                                  ? 'Home Resident'
                                  : 'Unknown Account Type',
                          style: medium16(context)
                              .copyWith(color: AppColors.primary)),
                      SizedBox(height: height(context) * 0.02),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                EditableTextField(
                  controller: _email,
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  isEditable: true,
                ),
                const SizedBox(height: 16),
                // First Name field
                EditableTextField(
                  controller: _firstName,
                  label: "First Name",
                  keyboardType: TextInputType.name,
                  isEditable: true,
                ),
                const SizedBox(height: 16),
                // Middle Name field
                EditableTextField(
                  controller: _middleName,
                  label: "Middle Name",
                  keyboardType: TextInputType.name,
                  isEditable: true,
                ),
                const SizedBox(height: 16),

                // Last Name field
                EditableTextField(
                  controller: _lastName,
                  label: "Last Name",
                  keyboardType: TextInputType.name,
                  isEditable: true,
                ),
                const SizedBox(height: 16),
                // Address field
                EditableTextField(
                  controller: _address,
                  label: "Address",
                  keyboardType: TextInputType.streetAddress,
                  isEditable: true,
                ),
                const SizedBox(height: 16),
                EditableTextField(
                  controller: _phone2,
                  label: "Secondary Phone Number",
                  keyboardType: TextInputType.phone,
                  isEditable: true,
                ),
                const SizedBox(height: 16),
                HomeOwnerDatePicker(_dob, text: "Date of Birth"),
                // // Date of Birth field with DatePicker
                // TextField(
                //   controller: _dob,
                //   decoration: const InputDecoration(labelText: "Date of Birth"),
                //   onTap: () async {
                //     // Show DatePicker
                //     DateTime? pickedDate = await showDatePicker(
                //       context: context,
                //       initialDate: DateTime.parse(_dob.text),
                //       firstDate: DateTime(1900),
                //       lastDate: DateTime.now(),
                //     );

                //     if (pickedDate != null &&
                //         pickedDate != DateTime.parse(_dob.text)) {
                //       _dob.text = pickedDate.toLocal().toString().split(' ')[0];
                //     }
                //   },
                // ),
                const SizedBox(height: 16),

                // Save Button
                AppButton(
                  onPressed: () async {
                    await updateUserProfile(ref);
                    context.pop();
                  },
                  text: "Update User",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
