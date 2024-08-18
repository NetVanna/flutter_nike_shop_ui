import 'package:flutter/material.dart';
import 'package:nike_shoe_app_ui/components/custome_snackbar.dart';
import 'package:nike_shoe_app_ui/data/dummy_data.dart';
import 'package:nike_shoe_app_ui/models/shoe_models.dart';

class AppMethods {
  AppMethods._();

  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);
    if(contains){
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBars.failSnackBar());
    }else{
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBars.successSnackBar());
    }
  }

  static double allTheItemsOnBag(){
    double sumPrice = 0.0;
    for (ShoeModel item in itemsOnBag){
      sumPrice = sumPrice + item.price;
    }
    return sumPrice;
  }

}
