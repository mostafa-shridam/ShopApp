import 'dart:developer';

import 'package:ahmed/model/product_model.dart';
import 'package:ahmed/services/update_product.dart';
import 'package:ahmed/widgets/custom_button.dart';
import 'package:ahmed/widgets/my_text_filed.dart';
import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    super.key,
  });

  static String id = 'update';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? titleController;

  String? priceController;

  String? imageController;

  String? descController;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)?.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading) const LinearProgressIndicator(),
              const SizedBox(
                height: 100,
              ),
              MyTextFiled(
                label: 'Title',
                onChanged: (data) {
                  titleController = data;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              MyTextFiled(
                label: 'Description',
                onChanged: (data) {
                  descController = data;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              MyTextFiled(
                label: 'Price',
                keyboardType: TextInputType.number,
                onChanged: (data) {
                  priceController = double.parse(data).toString();
                },
              ),
              const SizedBox(
                height: 12,
              ),
              MyTextFiled(
                label: 'Image',
                onChanged: (data) {
                  imageController = data;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'update',
                function: () async {
                  isLoading = true;
                  setState(() {});

                  try {
                    await updateProductFunction(productModel);
                  } catch (e) {
                    log(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProductFunction(ProductModel product) async {
    await UpdateProduct().updateProduct(
      id: product.id,
      title: titleController == null ? product.title : titleController!,
      price:
          priceController == null ? product.price.toString() : priceController!,
      description:
          descController == null ? product.description : descController!,
      image: imageController == null ? product.image : imageController!,
      category: product.category,
    );
  }
}
