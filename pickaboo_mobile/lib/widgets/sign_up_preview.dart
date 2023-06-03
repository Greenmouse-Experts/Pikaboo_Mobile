import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class SignUpPreview extends StatelessWidget {
  final String image;
  final String header;
  const SignUpPreview({super.key, required this.image, required this.header});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.02),
        width: width(context) * 0.415,
        height: height(context) * 0.33,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/icons/$image.png'),
              SizedBox(
                width: width(context) * 0.3,
                child: Text(
                  header,
                  style: semi18(context).copyWith(color: AppColors.darkAsh),
                  maxLines: 2,
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing Vivamus fringilla.',
                style: regular11(context)
                    .copyWith(color: AppColors.darkAsh.withOpacity(0.85)),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Sign In',
                  style: regular11(context).copyWith(color: AppColors.primary),
                ),
              ),
            ]),
      ),
    );
  }
}
