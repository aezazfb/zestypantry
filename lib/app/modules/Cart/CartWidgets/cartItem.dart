import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zestypantry/globalVariables.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool checkedValue = false;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //for (int x = 0; x <  cartItems.length - 1; x++)
          Obx(() => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:cartItems.length,
              itemBuilder: (context,index){
                //var cartAddedItemVar = cartAddedItems.where((p0) => p0[0] == cartItems[index][0]).first;
                //List currentAddedItem = im.toList();
                return  Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Checkbox(
                          //   value: checkedValue,
                          //   onChanged: (val) {
                          //     setState(() {
                          //       checkedValue = val!;
                          //     });
                          //   },
                          //   activeColor: const Color(0xFFFFB608),
                          // ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 230, 177),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.2))
                              ],
                            ),
                            child: Image.asset(fit: BoxFit.contain, "assets/imgs/1.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Text( cartItems.isNotEmpty ? cartItems[index]["name"]: "Item",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(168, 0, 0, 0)),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                 Row(
                                  children: [
                                    Text(
                                      "Rs ${ cartItems.isNotEmpty ? cartItems[index]["price"] : 100}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFB608)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      " / ${ cartItems.isNotEmpty ? cartItems[index]["unit"] : "Unit"}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFB608)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                onTap: (){
                                  if(cartItems.isNotEmpty){
                                    cartSubTotal -= cartItems[index]["price"] * cartItems[index]["itemCountInCart"];
                                    serviceCharges.value = (cartSubTotal.value * serviceChargePc).toInt();
                                    totalOrderCharges.value = cartSubTotal.value + (cartSubTotal.value * serviceChargePc).toInt();
                                  }
                                  cartItems.removeAt(index);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                      setState(() {
                                        cartItems[index]["itemCountInCart"] -= 1;
                                        if(cartItems.isNotEmpty){
                                          cartSubTotal -= cartItems[index]["price"];
                                          serviceCharges.value = (cartSubTotal.value * serviceChargePc).toInt();
                                          totalOrderCharges.value = cartSubTotal.value + (cartSubTotal.value * serviceChargePc).toInt();
                                        }
                                        if(cartItems[index]["itemCountInCart"] == 0 ){
                                          cartItems.removeAt(index);
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFB608),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(CupertinoIcons.minus),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      // color: Color(0xFFFFB608),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(cartItems[index]["itemCountInCart"].toString()),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                      setState(() {
                                        cartItems[index]["itemCountInCart"] += 1;
                                        if(cartItems.isNotEmpty){
                                          cartSubTotal += cartItems[index]["price"];
                                          serviceCharges.value = (cartSubTotal.value * serviceChargePc).toInt();
                                          totalOrderCharges.value = cartSubTotal.value + (cartSubTotal.value * serviceChargePc).toInt();
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFB608),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(Icons.add),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                thickness: 1,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              })),
      ],
    );
  }
}
