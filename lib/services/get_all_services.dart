import 'dart:convert';

import 'package:ahmed/helper/api.dart';
import 'package:ahmed/model/product_model.dart';
import 'package:http/http.dart';

class GetAllServices {
  Future<List<ProductModel>> getAllProducts() async {
    Response response =
        await Api().get(url: 'https://fakestoreapi.com/products', token: '');

    List<dynamic> data = jsonDecode(response.body);

    List<ProductModel> listProduct = [];
    for (int i = 0; i < data.length; i++) {
      listProduct.add(
        ProductModel.fromJson(
          data[i],
        ),
      );
    }
    return listProduct;
  }
}
