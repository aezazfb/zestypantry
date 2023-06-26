import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zestypantry/globalVariables.dart';

class HomePagePost extends StatelessWidget {
  const HomePagePost({
    super.key,
    required this.itemName,
    this.itemPrice,
    this.itemQuantity,
    this.itemImage,
    this.itemUnit,
    this.postTitle,
    this.theItem
  });

  final dynamic theItem;
  final String itemName;
  final String? itemPrice;
  final String? itemQuantity;
  final String? itemUnit;
  final String? itemImage;
  final String? postTitle;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7f5f8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 5,
          spreadRadius: 1,
        ),],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              //Navigator.pushNamed(context, "ItemPage");
              Fluttertoast.showToast(msg: itemName);
              Get.toNamed("/item", arguments: theItem);
            },
            child: Image.asset(itemImage ?? "assets/imgs/cover2.jpg",
              fit: BoxFit.contain,
              height: 130,
              width: 120,),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName ?? "Item", style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Rs ${itemPrice ?? "100"}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFB608),
                      ),),
                    const SizedBox(height: 5,),
                    Text(" / ${itemUnit ?? "item"}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF241D0B),
                      ),),
                    const Spacer(),

                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle
                      ),
                      child: InkWell(
                        onTap: (){
                          Fluttertoast.showToast(msg: "Added To Cart!");

                          //cartButtonView.value = !cartButtonView.value;
                          //cartItemsCount++;
                          final cartItem = [itemName, itemPrice, itemUnit, itemQuantity];
                          cartItems.add(cartItem);
                          cartItemsCount.value = cartItems.length;
                        },
                        child: const Icon(Icons.add_shopping_cart,
                          color: Colors.white70,
                          size: 23,),

                      ),
                    ),

                    // Obx(() => InkWell(
                    //   onTap: (){
                    //     isFav.value = !isFav.value;
                    //     Fluttertoast.showToast(msg: "Added To Favs!");
                    //   },
                    //   child: isFav.value
                    //       ? const Icon(
                    //     Icons.favorite,
                    //     color: Colors.redAccent,
                    //     size: 29,
                    //   )
                    //       : const Icon(Icons.favorite_outline_rounded,
                    //     color: Color(0xFFFFB608),
                    //     size: 29,),
                    //
                    // )),

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ) ;
  }
}