import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/data/Converters/orderedItemsList.dart';
import 'package:zestypantry/app/data/functionalities/firebaseMessaging.dart';
import 'package:zestypantry/app/data/models/itemAvailable.dart';
import 'package:zestypantry/app/data/models/requests_model.dart';
import 'package:zestypantry/globalVariables.dart';

import '../controllers/requests_controller.dart';

class RequestsView extends GetView<RequestsController> {
  RequestsView({Key? key}) : super(key: key);

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileCtrl  = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() => ListView(
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
                    border: Border.all(color: controller.nameFocused.value ? Colors.amber : Colors.black54),
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 370,
                child: TextFormField(
                  controller: nameCtrl,
                  focusNode: controller.focusName,
                  autofocus: true,
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
                    border: Border.all(color: controller.mobFocused.value ? Colors.amber : Colors.black54),
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 370,
                child: TextFormField(
                  controller: mobileCtrl,
                  focusNode: controller.focusMob,
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
                    border: Border.all(color: controller.addressFocused.value ? Colors.amber : Colors.black54),
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 370,
                child: TextFormField(
                  controller: addressCtrl,
                  focusNode: controller.focusAddress,
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
                  // controller.addRequest(Requests(
                  //     address: addressCtrl.text,
                  //     consumerContact: mobileCtrl.text,
                  //     customerDetails: [nameCtrl.text, addressCtrl.text],
                  //   requestStatus: 'Processing',
                  //   discounted: false,
                  //   requestType: "Cash On Delivery",
                  //   requestAmount: totalOrderCharges.value,
                  //   requestDateTime: DateTime.now()
                  // ));

                  ItemsNotAvailable itemsCheck = await controller.itemQuantityCheck(cartItems);

                  if(itemsCheck.available){
                    controller.addRequest2(Requests(
                        requestDateTime: DateTime.now(),
                        requestStatus: 'Processing',
                        requestAmount: totalOrderCharges.value,
                        requestDetails: 'The test Request',
                        customerDetails: [nameCtrl.text, addressCtrl.text, mobileCtrl.text, 'customer era'],
                        requestedItems: orderedItemsList(cartItems),
                        address: addressCtrl.text,
                        sellerID: 1,
                        consumerContact: mobileCtrl.text,
                        requestType: 'Pick up',
                        discountDetails: '20%',
                        discounted: true,
                        riderDetails: 'Az'


                    ) );
                  }
                  else{
                    //Fluttertoast.showToast(msg: "${itemsCheck.namesConcatenated} just sold out! ");
                    Get.snackbar("Change in Stock", "${itemsCheck.namesConcatenated} ${itemsCheck.quantityLeft} left!");
                  }



                  // FirebaseApi().createPushNotification("New Request", "New request received!", await FirebaseApi().generateAccessToken(), adminDeviceFcm);
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
      )),
    );
  }
}
