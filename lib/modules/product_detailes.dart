// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/models/all_product_model.dart';
import 'package:ecommerce_app/modules/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailes extends StatelessWidget {
  ProductDetailes(this.product);
  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  //maxLines: 1,
                  //overflow: TextOverflow.ellipsis,
                ),
              ),
              Center(
                child: Image(
                  image: NetworkImage(product.image),
                  height: 300,
                  width: 200,
                ),
              ),
              Center(
                child: buildRatingItem(product.rating.rate.toDouble()),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                '\$ ${product.price}',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                    ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
