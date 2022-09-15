import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void navigateTo(BuildContext context,Widget page){
  //Navigator.push(context, page);
  Navigator.push(context,MaterialPageRoute(builder: (context) => page),);
}
void navigateandforget(BuildContext context,Widget page){
  //Navigator.push(context, page);
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => page),
  (route) => false,
  );
}

/* Widget defaultTextFormField({
  required TextEditingController controller,
  required bool ispassword,
  required Function function(String),
}){
  return TextFormField(
    controller: controller,
    obscureText: ispassword,
    
    //validator: (function),
  );
} */