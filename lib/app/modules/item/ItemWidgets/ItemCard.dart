import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zestypantry/app/data/Repositories/globalRepo.dart';
import 'package:zestypantry/app/data/models/product_model.dart';
import 'package:zestypantry/app/routes/app_pages.dart';
import 'package:zestypantry/globalVariables.dart';
import 'package:zestypantry/app/data/Converters/cartItemFromProduct.dart' as CartItemConverter;

import '../../../data/models/itemAvailable.dart';

class HomePagePost extends StatelessWidget {
   HomePagePost({
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

  dynamic mappedProduct;

   // final FirebaseFirestore theDatabase = FirebaseFirestore.instance;
   //
   // Future<bool> itemQuantityCheck(String productID) async{
   //   bool itemAvailable = true;
   //   bool stockAvailable;
   //   int itemStockQuantity;
   //   DocumentSnapshot theDoc = await theDatabase.collection("product").doc(productID).get();
   //   stockAvailable = theDoc.get("inStock");
   //   itemStockQuantity = theDoc.get("quantity");
   //
   //   if(stockAvailable == false){
   //
   //
   //
   //   }else{
   //     // if(itemStockQuantity < item['itemCountInCart']){
   //     //
   //     // }
   //   }
   //   return itemAvailable;
   // }

  @override
  Widget build(BuildContext context) {
    if(theItem!=  null){
      mappedProduct = Product.fromDocumentSnapshot(theItem);
    }
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
              Get.toNamed(Routes.ITEM, arguments: mappedProduct);
            },
            child: mappedProduct.productImage !=  null ? CachedNetworkImage(
            imageUrl: mappedProduct.productImage ?? itemImage ?? "assets/imgs/cover2.jpg",
            fit: BoxFit.contain,
            height: 130,
            width: 120,
            filterQuality: FilterQuality.high,
            placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
            ) :
    Image.asset(mappedProduct.productImage ?? itemImage ?? "assets/imgs/cover2.jpg",
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
                    Text("Rs ${mappedProduct.price ?? itemPrice ?? "100"}",
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: themeBtnColor,
                      ),),
                    const SizedBox(height: 5,),
                    Text(" / ${mappedProduct.unit ?? itemUnit ?? "item"}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF241D0B),
                      ),),
                    const Spacer(),

                    Container(
                      // height: 35,
                      // width: 35,
                      // decoration:  BoxDecoration(
                      //     color: themeBtnColor,
                      //     shape: BoxShape.circle
                      // ),
                      child: InkWell(
                        onTap: () async {

                          ItemAvailable itemQuantityCheck = await GlobalFunctions().itemQuantityCheck(mappedProduct.productID);


                          if(itemQuantityCheck.available){
                            if(cartItems.isEmpty){

                              var itemSelected = CartItemConverter.cartItem(mappedProduct);
                              cartItems.add(itemSelected);
                              //Fluttertoast.showToast(msg: "${itemSelected["name"]} Added to Cart!");

                            }else{

                              var existingItem = cartItems.where((element) => element["productID"] == mappedProduct.productID).firstOrNull;

                              if(existingItem == null){

                                var itemSelected = CartItemConverter.cartItem(mappedProduct);
                                cartItems.add(itemSelected);
                                //Fluttertoast.showToast(msg: "${itemSelected["name"]} Added to Cart!");

                              }
                              else if (itemQuantityCheck.noOfItems > existingItem["itemCountInCart"]){
                                existingItem["itemCountInCart"] += 1;
                                Fluttertoast.showToast(msg: "${existingItem["itemCountInCart"]} ${existingItem["name"]} in Cart!");
                              }
                              else{
                                Fluttertoast.showToast(msg: "Maximum Quantity Reached!");
                              }
                            }
                            cartTotalItems.value = GlobalFunctions().totalItemsInCart(cartItems);
                          }
                          else{
                            Fluttertoast.showToast(msg: "Out of Stock!");
                          }


                        },
                        child:  Icon(Icons.add_shopping_cart,
                          color: themeBtnColor,
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
                    //     color: themeBtnColor,
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