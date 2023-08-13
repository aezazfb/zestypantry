import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zestypantry/app/data/functionalities/firebaseMessaging.dart';
import 'package:zestypantry/app/data/models/requests_model.dart';
import 'package:zestypantry/app/data/models/requests_modelOld.dart';
import 'package:zestypantry/globalVariables.dart';

class RequestsController extends GetxController {
  //TODO: Implement RequestsController

  final count = 0.obs;
  RxBool nameFocused = false.obs;
  RxBool mobFocused = false.obs;
  RxBool addressFocused = false.obs;

  late FocusNode focusName;
  late FocusNode focusMob;
  late FocusNode focusAddress;

  final CollectionReference requestCollection =
  FirebaseFirestore.instance.collection("requests");
  
  
  @override
  void onInit() {

    focusName = FocusNode();
    focusMob = FocusNode();
    focusAddress = FocusNode();

    focusName.addListener(() { nameFocused.value = focusName.hasFocus;});
    focusMob.addListener(() { mobFocused.value = focusMob.hasFocus;});
    focusAddress.addListener(() { addressFocused.value = focusAddress.hasFocus;});
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  addRequest(Requests request) async {
    await requestCollection.add(request.toJson()).whenComplete(() => Fluttertoast.showToast(msg: 'Request Submitted Successfully'));
  }

  addRequest2(Requests requestData) async {
    await FirebaseFirestore.instance.collection("requests").add(requestData.toJson())
        .whenComplete(() async {
      Fluttertoast.showToast(msg: "Request Submitted Successfully!");
      FirebaseApi().createPushNotification("New Request", "reqeust body is this", await FirebaseApi().generateAccessToken(), adminDeviceFcm);
    });
  }
  
  updateRequest(Requests request_) async {
    await requestCollection.doc(request_.requestID).update(request_.toJson()).whenComplete(() => Fluttertoast.showToast(msg: "Request Updated!"));
  }
  
  deleteRequest (String requestId) async {
    await requestCollection.doc(requestId).delete().whenComplete(() => Fluttertoast.showToast(msg: "Request Deleted Successfully!"));
  }

  void increment() => count.value++;
}
