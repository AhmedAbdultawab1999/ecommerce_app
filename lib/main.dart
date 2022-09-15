// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/controllers/get_all_categories.dart';
import 'package:ecommerce_app/controllers/get_all_producta.dart';
import 'package:ecommerce_app/modules/home_page.dart';
import 'package:ecommerce_app/modules/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'controllers/shared/bloc_observer.dart';
import 'controllers/shared/cubit/cubit.dart';
import 'controllers/shared/styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
   () {
     runApp(MyApp());
   },
   blocObserver: MyBlocObserver(),
 );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context) => AppCubit()..gettProducts() ,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


