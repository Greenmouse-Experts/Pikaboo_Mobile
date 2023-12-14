
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickaboo_mobile/utilities/app_colors.dart';
import 'package:pickaboo_mobile/utilities/app_dimensions.dart';
import 'package:pickaboo_mobile/widgets/app_image.dart';
import 'package:pickaboo_mobile/widgets/overlays.dart';

class ImageSelector extends StatefulWidget {
  final String imgUrl;
  final String? name;
  final Function updateImage;
  const ImageSelector(
      {super.key, required this.imgUrl, required this.name, required this.updateImage});

  @override
  State<ImageSelector> createState() => ImageSelectorState();
}

class ImageSelectorState extends State<ImageSelector> {
  final ImagePicker _picker = ImagePicker();
  String? selectedImg;

  Future<void> _selectImage() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemp = File(image.path);

        setState(() {
          selectedImg = imageTemp.path;
          widget.updateImage(imageTemp);
        });
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      AppOverlays.showErrorDialog(context: context, error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectImage,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppAvatar(
            imgUrl: widget.imgUrl,
            radius: width(context) * 0.08,
            selectedImg: selectedImg,
            name: widget.name ?? 'h',
          ),
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
                  ),),),
        ],
      ),
    );
  }
}
