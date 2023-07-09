import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/models/models.dart';
import '../utilities/utilities.dart';

class ProductCard extends StatelessWidget {
  final ProductsSchema product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final image = product.images == null || product.images!.isEmpty
        ? 'https://res.cloudinary.com/greenmouse-tech/image/upload/v1688402669/pikaboo/pickaboo_logo_eatts5.png'
        : product.images![0];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () => context.pushNamed(AppRouter.productPage,
            pathParameters: {'product': product.toRawJson()}),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          child: Padding(
            padding: isMobile(context)
                ? const EdgeInsets.all(8.0)
                : EdgeInsets.all(width(context) * 0.02),
            child: Row(
              children: [
                ProductImage(
                  image: image,
                ),
                SizedBox(width: width(context) * 0.04),
                Expanded(
                  child: SizedBox(
                    height: width(context) * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(product.name ?? '', style: medium13(context)),
                        Text(product.description ?? '',
                            style: regular11(context).copyWith(
                                color: Colors.black.withOpacity(0.4))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('NGN ${product.price ?? ''}',
                                style: medium13(context)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductGridCard extends StatelessWidget {
  final ProductsSchema product;
  const ProductGridCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final image = product.images == null || product.images!.isEmpty
        ? 'https://res.cloudinary.com/greenmouse-tech/image/upload/v1688402669/pikaboo/pickaboo_logo_eatts5.png'
        : product.images![0];
    return InkWell(
      onTap: () => context.pushNamed(AppRouter.productPage,
          pathParameters: {'product': product.toRawJson()}),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.fadeGreen,
            border: Border.all(color: AppColors.primary)),
        child: Column(
          children: [
            SizedBox(
              width: width(context) * 0.35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                    imageUrl: image,
                    errorWidget: (context, url, error) {
                      return Image.asset('assets/images/pickaboo_logo.png');
                    },
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary),
                          ),
                        )),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(width(context) * 0.025),
              child: Text(
                product.name ?? '',
                style: medium13(context),
              ),
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.32,
      height: width(context) * 0.35,
      color: AppColors.fadeGreen,
      child: Padding(
        padding: EdgeInsets.all(width(context) * 0.01),
        child: CachedNetworkImage(
            imageUrl: image,
            errorWidget: (context, url, error) {
              return Image.asset('assets/images/pickaboo_logo.png');
            },
            progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                )),
      ),
    );
  }
}
