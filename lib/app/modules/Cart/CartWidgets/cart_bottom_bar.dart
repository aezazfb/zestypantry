import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zestypantry/app/modules/Order/views/order_view.dart';
import 'package:zestypantry/globalVariables.dart';

class CartBottomBar extends StatelessWidget{
  const CartBottomBar({super.key});

  @override

  Widget build(BuildContext context){
    return Container(
      height: 111, //123 honi chahye
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
            color: Colors.black12.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5
        )],
      ),
      child: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.only(top: 10),
          //   child: Row(
          //     children: [
          //       Icon(Icons.discount_rounded),
          //       Text("Use Promo",
          //         style: TextStyle(
          //             color: Color.fromARGB(162, 0, 0, 0),
          //             fontWeight: FontWeight.bold
          //         ),),
          //     ],
          //   ),
          // ),
          const Divider(
            height: 25,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Obx(() => Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text("Total",
                     style: TextStyle(
                         color: Color.fromARGB(162, 0, 0, 0),
                         fontWeight: FontWeight.bold,
                         fontSize: 23
                     ),),
                   const SizedBox(height: 5,),
                   Text("Rs $totalOrderCharges",
                     style:  TextStyle(
                         color: themeBtnColor,
                         fontWeight: FontWeight.bold,
                         fontSize: 21
                     ),),
                 ],
               )),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesStr.REQUESTS);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color:  themeBtnColor,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: const Text("Check Out",
                    style: TextStyle(
                        color: Color.fromARGB(162, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 23
                    ),),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}