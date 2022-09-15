import 'dart:convert';

import 'package:ecommerce_app/controllers/shared/Api.dart';
import 'package:ecommerce_app/models/all_product_model.dart';
import 'package:http/http.dart' as http;

class GetProducts{

   Future<List<ProductsModel>> gettProducts() async{
    List<ProductsModel> productList=[];
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/');
  for(int i=0;i<data.length;i++){
    productList.add(
      ProductsModel.fromJson(data[i])
    );
  }
  return await productList;
  }
}