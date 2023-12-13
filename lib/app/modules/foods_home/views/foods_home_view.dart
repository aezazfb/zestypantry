import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/modules/foods_home/widgets/food_view_tile.dart';

import '../controllers/foods_home_controller.dart';

class FoodsHomeView extends GetView<FoodsHomeController> {
  const FoodsHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodsHomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FoodMenuTile(foodName: "Anda"),
            FoodMenuTile(foodName: "Chai"),
            FoodMenuTile(foodName: "Chalo"),
            FoodMenuTile(foodName: "Omelette"),
            FoodMenuTile(foodName: "Salt"),
          ],
        ),
      ),
    );
  }
}
