import 'package:ecommerce_app/controllers/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/all_product_model.dart';
import '../Api.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  List<ProductsModel> productList = [];
  Future<List<ProductsModel>> gettProducts() async {
    productList = [];
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/');
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductsModel.fromJson(data[i]));
      productList.forEach((element) {
        print(element.id);
      });
    }
    print('product list = ${productList.length}');
    return productList;
  }

  Future<dynamic> update_product({
    required int id,
    @required String? title,
    @required dynamic price,
    @required String? description,
    @required String? image,
    @required String? category,
  }) async {
    Null data = await Api()
        .update(
            id: id,
            title: title,
            price: price,
            description: description,
            image: image,
            category: category)
        .then((value) {})
        .catchError((error) {
      print(error);
    });
    return data;
  }
}
