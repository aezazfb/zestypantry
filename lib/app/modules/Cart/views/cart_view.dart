import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/modules/Cart/CartWidgets/cartItem.dart';
import 'package:zestypantry/app/modules/Cart/CartWidgets/cart_bottom_bar.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var checkedValue = true;
    return Scaffold(
      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Text("  MyCart",
                    style: TextStyle(
                      color: Color(0xFFFFB608),
                      fontSize: 19,
                    ),),
                ),
                const Spacer(),
                InkWell(onTap: () {

                },
                    child: const Icon(CupertinoIcons.bell_fill,
                      color: Color(0xFFFFB608),)
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            color: Colors.white,
            child: const Column(
                children:[
                  // const Divider(height: 15, thickness: 1,),
                  // CheckboxListTile(title: const Text("Select ALl ",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //
                  //   ),),
                  //   value: checkedValue,
                  //   onChanged: (newVal){
                  //
                  //   },
                  //   controlAffinity: ListTileControlAffinity.leading,
                  //
                  // ),
                  // const Divider(height: 15, thickness: 1,),
                  CartItem()
                ]
            ),

          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.2),
                )]
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub-Total",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(166, 0, 0, 0)
                      ),),
                    Text("\$300",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(166, 0, 0, 0)
                      ),),
                  ],
                ),
                Divider(thickness: 1, height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Service-Charges",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(166, 0, 0, 0)
                      ),),
                    Text("\$100",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(166, 0, 0, 0)
                      ),),
                  ],
                ),
                Divider(thickness: 1, height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(166, 0, 0, 0)
                      ),),
                    Text("-\$51",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(166, 0, 0, 0)
                      ),),
                  ],
                ),
                Divider(thickness: 1, height: 20,)
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CartBottomBar(),
    );
  }
}
