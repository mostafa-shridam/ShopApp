import 'package:ahmed/model/product_model.dart';
import 'package:ahmed/screens/product_detials_screen.dart';
import 'package:ahmed/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.product,
  });

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: product);
      },
      onTap: () {
        Navigator.pushNamed(context, ProductDetials.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(6, 6),
                blurStyle: BlurStyle.normal,
              ),
            ]),
            child: Card(
              elevation: 10,
              semanticContainer: true,
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${product.price}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          splashRadius: 16,
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: -60,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
