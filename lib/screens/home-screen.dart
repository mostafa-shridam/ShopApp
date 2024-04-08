import 'package:ahmed/model/product_model.dart';
import 'package:ahmed/screens/add_product_screen.dart';
import 'package:ahmed/widgets/category_card.dart';
import 'package:ahmed/widgets/products_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ProductModel? productModel;

  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Souqy',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddProductScreen.id,
                arguments: productModel,
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoryCard(),
            ),
            SliverToBoxAdapter(
              child: ProductsCard(),
            ),
          ],
        ),
      ),
    );
  }
}
