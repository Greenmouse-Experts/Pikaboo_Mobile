import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth/auth_controller.dart';
import '../utilities/utilities.dart';

class AppSvgImage extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final Color? color;
  final String image;
  const AppSvgImage(
      {super.key,
      this.imageWidth,
      this.imageHeight,
      required this.image,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: imageHeight,
      width: imageWidth,
      // ignore: deprecated_member_use
      color: color,
    );
  }
}

class AppImage extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String image;
  const AppImage(
      {super.key,
      required this.imageWidth,
      required this.imageHeight,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(4),
      height: height(context) * imageHeight,
      width: width(context) * imageWidth,
      child: Image.asset(
        image,
        // fit: BoxFit.contain,
      ),
    );
  }
}

class AppAvatar extends StatelessWidget {
  const AppAvatar(
      {Key? key,
      this.imgUrl = '',
      this.selectedImg,
      this.radius = 55,
      this.backgroundColor = const Color(0xffEEF5FE),
      required this.name})
      : super(key: key);

  final String imgUrl;
  final String? selectedImg;
  final double radius;
  final String name;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius * 2),
          child: selectedImg == null
              ? CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Center(
                      child: Text(
                        name.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: radius * 0.7,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                  width: radius * 2,
                  height: radius * 2,
                )
              : Image.file(
                  File(selectedImg!),
                  fit: BoxFit.cover,
                  height: radius * 2,
                  width: radius * 2,
                ),
        ),
      ),
    );
  }
}

class AppBarIcon extends ConsumerWidget {
  final String name;
  final String image;
  const AppBarIcon({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountType = ref.watch(authProvider).accountType;
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () => context.pushNamed(
          accountType == 'Service Personnel'
              ? AppRouter.driverAccountView
              : AppRouter.userAccountView,
        ),
        child: AppAvatar(
          name: name,
          imgUrl: image,
          radius: isMobile(context)
              ? width(context) * 0.045
              : width(context) * 0.04,
        ),
      );
    });
  }
}
