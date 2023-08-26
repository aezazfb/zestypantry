import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zestypantry/app/data/functionalities/firebaseMessaging.dart';
import 'package:zestypantry/app/data/models/requests_model.dart';
import 'package:zestypantry/globalVariables.dart';

class OrderController extends GetxController {
  //TODO: Implement OrderController

  final CollectionReference theOrderCollection =
  FirebaseFirestore.instance.collection("order");

  final FirebaseFirestore theDatabase = FirebaseFirestore.instance;
  addRequest(Requests requestData) async {
    await theDatabase.collection("requests").add(requestData.toJson())
        .whenComplete(() async {
      Fluttertoast.showToast(msg: "Request Submitted Successfully!");
      FirebaseApi().createPushNotification("New Request", "reqeust body is this", await FirebaseApi().generateAccessToken(), adminDeviceFcm);
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
