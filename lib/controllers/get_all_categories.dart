import 'dart:convert';

import 'package:ecommerce_app/controllers/shared/Api.dart';
import 'package:http/http.dart' as http;

class GetAllCategories {
  Future<List<dynamic>> getCategories() async {
    print('getting data');
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories');
    print(data);
      return data;
  }
}
