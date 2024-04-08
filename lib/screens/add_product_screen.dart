import 'dart:developer';

import 'package:ahmed/model/product_model.dart';
import 'package:ahmed/services/add_product.dart';
import 'package:ahmed/widgets/custom_button.dart';
import 'package:ahmed/widgets/my_text_filed.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({
    super.key,
  });

  static String id = 'add';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? titleController;

  String? priceController;

  String? imageController;
  String? categoryController;

  String? descController;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel? product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add new product'),
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
              height: 12,
            ),
            MyTextFiled(
              label: 'Category',
              onChanged: (data) {
                categoryController = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
             title: isLoading == false ?  'add' : 'Loading...',
              function: () async {
                isLoading = true;
                setState(() {});

                try {
                  if (product != null) {
                    await buildFunction(product);
                  }
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

  Future<void> buildFunction(ProductModel product) async {
    await AddProduct().addProduct(
      id: product.id,
      title: titleController!,
      price: priceController!,
      description: descController!,
      image: imageController!,
      category: categoryController,
    );
  }
}
