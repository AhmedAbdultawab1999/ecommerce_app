// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce_app/controllers/shared/cubit/cubit.dart';
import 'package:ecommerce_app/controllers/shared/cubit/states.dart';
import 'package:ecommerce_app/models/all_product_model.dart';
import 'package:ecommerce_app/modules/product_detailes.dart';
import 'package:ecommerce_app/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('New Trends'),
            centerTitle: true,
            elevation: .7,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
            ],
          ),
          body: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: cubit.productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCardItem(cubit.productList[index], context);
                },
              ),
            ),        );
      },
    );
  }
}

Widget buildCardItem(ProductsModel product, BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: GestureDetector(
        onTap: (() {
          navigateTo(context, ProductDetailes(product));
        }),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 5,
                    offset: Offset(10, 10)),
              ]),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('\$ ${product.price}'),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                            color: Colors.red,
                          )
                        ],
                      ),
                      Center(
                        child: buildRatingItem(product.rating.rate.toDouble()),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -20,
              right: 10,
              child: Image(
                image: NetworkImage(product.image),
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );

Widget buildRatingItem(double rating) => RatingBar.builder(
      initialRating: rating,
      itemSize: 25,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
