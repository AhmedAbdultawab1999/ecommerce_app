import 'dart:convert';

import 'package:ecommerce_app/controllers/shared/Api.dart';
import 'package:ecommerce_app/models/all_product_model.dart';
import 'package:http/http.dart' as http;
class GetCategoryProducts{

   Future<List<ProductsModel>> getCategoryProducts({required String category_name}) async{

    List<ProductsModel> productListByCategory=[];

    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/$category_name');
  for(int i=0;i<data.length;i++){
    productListByCategory.add(
      ProductsModel.fromJson(data[i])
    );
  }
  
    return productListByCategory;
  }
}