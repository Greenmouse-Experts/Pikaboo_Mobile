import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickaboo_mobile/utilities/app_colors.dart';
import 'package:pickaboo_mobile/widgets/app_button.dart';

class UserDetailsWidget extends StatefulWidget {
  final String? buildingImagePath;
  final TextEditingController buildingImagesController;

  const UserDetailsWidget({
    super.key,
    required this.buildingImagesController,
    this.buildingImagePath,
  });

  @override
  _UserDetailsWidgetState createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  String? newBuildingImagePath;

  Future<void> _updateBuildingImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        newBuildingImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (newBuildingImagePath != null)
          SizedBox(
            width: 200,
            height: 170,
            child: Stack(
              children: [
                // Show the new building image
                Image.file(
                  File(newBuildingImagePath!),
                  width: 200,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                // Show the "Building Image" text on top
              ],
            ),
          )
        else if (widget.buildingImagePath != null)
          SizedBox(
            width: 200,
            height: 170,
            child: Stack(
              children: [
                // Show the original building image
                Image.network(
                  widget.buildingImagePath!,
                  width: 200,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )
        else
          Container(
            width: 200,
            height: 170,
            color: Colors.grey,
            child: const Icon(
              Icons.image,
              size: 50,
              color: Colors.white,
            ),
          ),
        const SizedBox(height: 10),
        // AppButton(
        //   onPressed: _updateBuildingImage,
        //   buttonColor: AppColors.primary,
        //   text: 'Update  Image',
        //   buttonWidth: 0.4,
        //   buttonHeight: 0.04,
        // ),
      ],
    );
  }
}
