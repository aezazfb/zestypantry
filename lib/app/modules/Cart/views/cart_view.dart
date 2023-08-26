import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/modules/Cart/CartWidgets/cartItem.dart';
import 'package:zestypantry/app/modules/Cart/CartWidgets/cart_bottom_bar.dart';
import 'package:zestypantry/globalVariables.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var checkedValue = true;
    if(cartItems.isNotEmpty){
      cartSubTotal.value = 0;
      for(int ix = 0; ix<cartItems.length; ix++){
        cartSubTotal += cartItems[ix]["price"] *  cartItems[ix]["itemCountInCart"];
      }
      serviceCharges.value = (cartSubTotal.value * serviceChargePc).toInt();
      totalOrderCharges.value = cartSubTotal.value + (cartSubTotal.value * serviceChargePc).toInt();
    }
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
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text("MyCart",
                    style: TextStyle(
                      color: themeBtnColor,
                      fontSize: 19,
                    ),),
                ),
                const Spacer(),
                InkWell(onTap: () {

                },
                    child:  Icon(CupertinoIcons.bell_fill,
                      color: themeBtnColor,)
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
            child: Obx(() => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Sub-Total",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeBtnColor
                      ),),
                    Text("Rs $cartSubTotal",
                      style:  TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeBtnColor
                      ),),
                  ],
                ),
                const Divider(thickness: 1, height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Service-Charges",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeBtnColor
                      ),),
                    Text("Rs $serviceCharges",
                      style:  TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeBtnColor
                      ),),
                  ],
                ),
                const Divider(thickness: 1, height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Discount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeBtnColor
                      ),),
                    Text("Rs $discountAmount",
                      style:  TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: themeBtnColor
                      ),),
                  ],
                ),
                const Divider(thickness: 1, height: 20,)
              ],
            )),
          )
        ],
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
