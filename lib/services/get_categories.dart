import 'dart:convert';
import 'dart:developer';

import 'package:ahmed/helper/api.dart';
import 'package:http/http.dart';

class GetCategoriesProduct {
  Future<List<dynamic>> getAllCategories() async {
    Response response =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    List<dynamic> data = jsonDecode(response.body);
    log(response.body);
    return data;
  }
}
