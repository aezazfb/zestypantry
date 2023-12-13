import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zestypantry/globalVariables.dart';

import '../controllers/item_controller.dart';

class ItemView extends GetView<ItemController> {
  ItemView({Key? key}) : super(key: key);

  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            //color: const Color.fromARGB(255, 255, 230, 177),
            width: double.infinity,
            height: 390,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 28,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: themeBackGroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5
                        )],

                      ),
                      child: const Icon(
                          Icons.favorite,
                      color: Colors.white70,),
                    )
                  ],
                ),
              ),
              data.productImage != null ? CachedNetworkImage(
                  imageUrl: data.productImage,
                width: 280,
                height: 290,
                fit: BoxFit.contain,
              ) : Image.asset(
                "assets/imgs/1.png",
                width: 280,
                height: 290,
                fit: BoxFit.contain,)
            ]),
          ),
          const SizedBox(height: 15,),

          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 20),

            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ]
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                 Column(
                  children: [
                    Text("Rs ${data.price}",
                      style:  TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: themeBtnColor,
                      ),),
                     Text("Per ${data.unit}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),)
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15,),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1
                  )
                ]
            ),
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Product Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 8,),
                  Text("${data.description}",
                    style: const TextStyle(
                        fontSize: 18
                    ),)
                ]),
          ),
          const SizedBox(height: 9,),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const Padding(padding: EdgeInsets.only(left: 19),
          //       child: Text("You May Like",
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //
          //         ),),),
          //     const SizedBox(
          //       height: 5,
          //     ),
          //
          //     SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //         children: [
          //           for(int x = 1; x<=4; x++)
          //             Container(
          //               height: 90,
          //               width: 90,
          //               padding: const EdgeInsets.all(5),
          //               margin: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
          //               decoration: BoxDecoration(
          //                   color: const Color.fromARGB(255, 255, 230, 177),
          //                   borderRadius: BorderRadius.circular(10),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         spreadRadius: 1,
          //                         blurRadius: 5,
          //                         color: Colors.black.withOpacity(0.2)
          //                     ),
          //                   ]
          //               ),
          //
          //               child: Image.asset("assets/1.png",
          //                 fit: BoxFit.contain,
          //               ),
          //
          //             )
          //         ],
          //       ),
          //     )
          //
          //   ],
          // )
        ],
      ),
      //bottomNavigationBar: ItemBottomBar(),
    );
  }
}
