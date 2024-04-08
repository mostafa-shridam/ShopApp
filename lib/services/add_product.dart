import 'dart:developer';

import 'package:ahmed/helper/api.dart';
import 'package:ahmed/model/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    dynamic id,
    required String price,
    required String description,
    required String image,
     String? category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'id' : id,
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      }, token: '',
    );
    log('success, body : $data');
    return ProductModel.fromJson(data);
  }
}
