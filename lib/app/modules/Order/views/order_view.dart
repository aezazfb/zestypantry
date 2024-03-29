import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/data/functionalities/firebaseMessaging.dart';
import 'package:zestypantry/app/data/models/requests_model.dart';
import 'package:zestypantry/globalVariables.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  OrderView({Key? key}) : super(key: key);

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileCtrl  = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new,
                size: 28,),

            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Order Details",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(162, 0, 0, 0),
                      fontWeight: FontWeight.bold
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 370,
                child: TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: TextStyle(
                          fontSize: 20
                      )
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 370,
                child: TextFormField(
                  controller: mobileCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile",
                      hintStyle: TextStyle(
                          fontSize: 20
                      )
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 370,
                child: TextFormField(
                  controller: addressCtrl,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
                      hintStyle: TextStyle(
                          fontSize: 20
                      )
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              InkWell(
                onTap: () async {
                  controller.addRequest(Requests(
                    requestDateTime: DateTime.now(),
                    requestStatus: 'Processing',
                    requestAmount: totalOrderCharges.value,
                    requestDetails: 'The test Request',
                    customerDetails: [nameCtrl.text, addressCtrl.text, mobileCtrl.text, 'customer era'],
                    requestedItems: cartItems.value,
                    address: addressCtrl.text,
                    sellerID: 1,
                    consumerContact: mobileCtrl.text,
                    requestType: 'Pick up',
                    discountDetails: '20%',
                    discounted: true,
                    riderDetails: 'Az'


                  ) );


                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color:  themeBtnColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text("Order Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
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
