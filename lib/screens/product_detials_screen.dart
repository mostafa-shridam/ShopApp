import 'package:ahmed/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetials extends StatelessWidget {
  const ProductDetials({super.key, });

  static String id = 'details';

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = ModalRoute.of(context)?.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          productModel.title.substring(0, 12),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 22.0,
          left: 12,
          right: 12,
          top: 12,
        ),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Column(
            children: [
              Image.network(
                productModel.image,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(productModel.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                productModel.description,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black38,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Price : \$${productModel.price}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rate : ${productModel.rating.rate}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffcc37),
                    ),
                  ),
                  Text(
                    'Count : ${productModel.rating.count}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
