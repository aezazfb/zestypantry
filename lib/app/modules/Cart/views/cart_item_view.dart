import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartItemView extends GetView {
  const CartItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartItemView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CartItemView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
