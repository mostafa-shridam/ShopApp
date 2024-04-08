import 'package:ahmed/model/product_model.dart';
import 'package:ahmed/services/get_all_services.dart';
import 'package:ahmed/widgets/customCard.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key});

  static String id = 'card';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 66,
        bottom: 12,
      ),
      child: FutureBuilder<List<ProductModel>>(
        future: GetAllServices().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel>? products = snapshot.data;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                addSemanticIndexes: true,
                clipBehavior: Clip.none,
                cacheExtent: 2,
                itemCount: products?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 76,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    product: products![index],
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
