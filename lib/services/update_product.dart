import 'dart:developer';

import 'package:ahmed/helper/api.dart';
import 'package:ahmed/model/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String title,
    required dynamic id,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'id' : id,
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      }, token: '',
    );
    log('success');
    return ProductModel.fromJson(data);
  }
}