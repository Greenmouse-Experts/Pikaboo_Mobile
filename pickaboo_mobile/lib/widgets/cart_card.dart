import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height(context) * 0.01),
      padding: EdgeInsets.symmetric(
          vertical: height(context) * 0.01, horizontal: width(context) * 0.02),
      decoration: BoxDecoration(
          color: AppColors.fadeGreen2, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          SizedBox(
            width: width(context) * 0.24,
            height: width(context) * 0.24,
            child: Padding(
              padding: EdgeInsets.all(width(context) * 0.01),
              child: CachedNetworkImage(
                  imageUrl:
                      'https://res.cloudinary.com/greenmouse-tech/image/upload/v1688402669/pikaboo/pickaboo_logo_eatts5.png',
                  errorWidget: (context, url, error) {
                    return Image.asset('assets/images/pickaboo_logo.png');
                  },
                  progressIndicatorBuilder: (context, url, progress) => Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary),
                        ),
                      )),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width(context) * 0.3,
                child: Text(
                  'Waste Container',
                  style: medium14(context),
                ),
              ),
              SizedBox(height: height(context) * 0.01),
              OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      side: const BorderSide(color: AppColors.primary),
                      fixedSize:
                          Size(width(context) * 0.27, height(context) * 0.06)),
                  child: const Text('NGN 5000')),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: width(context) * 0.08,
                        height: height(context) * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            shape: BoxShape.circle),
                        child: Icon(Icons.remove,
                            size: width(context) * 0.06,
                            color: AppColors.primary)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.02),
                    child: Text('100', style: medium14(context)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: width(context) * 0.08,
                        height: height(context) * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            shape: BoxShape.circle),
                        child: Icon(Icons.add,
                            size: width(context) * 0.06,
                            color: AppColors.primary)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
