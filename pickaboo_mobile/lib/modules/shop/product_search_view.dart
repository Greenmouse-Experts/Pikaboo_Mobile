import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/products/product_controller.dart';
import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.red,
          size:
              isMobile(context) ? width(context) * 0.06 : width(context) * 0.05,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primary,
          size:
              isMobile(context) ? width(context) * 0.06 : width(context) * 0.05,
        ),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) =>
      Consumer(builder: (context, ref, _) {
        return FutureBuilder<List<ProductsSchema>>(
          future: ref
              .watch(productProvider)
              .searchProducts(ref: ref, keyword: query),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const PageLoader();
              default:
                if (snapshot.hasError) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Something went wrong!',
                      style: medium18(context),
                    ),
                  );
                } else {
                  final theProducts = snapshot.data ?? [];
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: theProducts.length,
                      itemBuilder: (context, i) => ProductCard(
                            product: theProducts[i],
                          ));
                }
            }
          },
        );
      });
  @override
  Widget buildSuggestions(BuildContext context) =>
      Consumer(builder: (context, ref, _) {
        return FutureBuilder<List<ProductsSchema>>(
          future: ref
              .watch(productProvider)
              .searchProducts(ref: ref, keyword: query),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const PageLoader();
              default:
                if (snapshot.hasError) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Something went wrong!',
                      style: medium18(context),
                    ),
                  );
                } else {
                  final theProducts = snapshot.data ?? [];
                  return theProducts.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          height: height(context) * 0.8,
                          child: Center(
                              child: Text(
                            query.isEmpty
                                ? 'Search a product now'
                                : 'No products matched your search, try another word',
                            textAlign: TextAlign.center,
                            style: medium16(context),
                          )),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: theProducts.length,
                          itemBuilder: (context, i) => ProductCard(
                                product: theProducts[i],
                              ));
                }
            }
          },
        );
      });
}
