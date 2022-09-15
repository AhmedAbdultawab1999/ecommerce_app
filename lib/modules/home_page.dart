import 'package:ecommerce_app/models/all_product_model.dart';
import 'package:ecommerce_app/modules/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controllers/shared/cubit/cubit.dart';
import '../controllers/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..gettProducts(),
      child: BlocConsumer<AppCubit, AppStates>(
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
              body: buildCartItem(cubit.productList[1]));
        },
      ),
    );
  }
}

Widget buildCartItem(ProductsModel product) => Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(.5),
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
                    // Center(
                    //   child: buildRatingItem(product.rating.rate),
                    // )
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
            ),
          ),
        ],
      ),
    );
















// GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: cubit.productList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return buildCardItem(cubit.productList[index]);
//               },
//             ),