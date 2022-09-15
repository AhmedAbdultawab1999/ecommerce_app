import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    //
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/'),
    );
    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw {'there is status code error ${response.statusCode}'};
    }
  }
  Future<dynamic> post({
    required String title,
    required dynamic price,
    required String description,
    required String image,
    required String category,
    
    }) async {

      http.Response response=await http.post(

        Uri.parse('https://fakestoreapi.com/products'),
        body: jsonEncode(
          {
          'title':title,
          'price':price,
          'description':description,
          'image':image,
          'category':category
        }
        ) 
      );
      jsonDecode(response.body);
      return response;
  }

  Future<dynamic> update({
    required int id,
    @required String? title,
    @required dynamic price,
    @required String? description,
    @required String? image,
    @required String? category,
    
    }) async {

      http.Response response=await http.put(

        Uri.parse('https://fakestoreapi.com/products/$id'),
        body: jsonEncode(
          {
          'title':title,
          'price':price,
          'description':description,
          'image':image,
          'category':category
        }
        ) 
      );
      jsonDecode(response.body);
      return response;
  }
}
