import 'dart:convert';

import 'package:http/http.dart' as http;

class AddNewProduct {
  List<String> AllCategories = [];
  Future<List<String>> addProduct() async {
    http.Response response = await http.post(
      Uri.parse('https://fakestoreapi.com/products/categories'),
      body: [
        
      ]
    );
    List<dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < data.length; i++) {
        AllCategories.add(data[i]);
      }

      return AllCategories;
    } else {
      throw {'there is status code error ${response.statusCode}'};
    }
  }
}
