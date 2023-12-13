import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zestypantry/app/data/models/product_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  dynamic theProducts;
  TextEditingController searchController = TextEditingController();
  final FirebaseFirestore theDatabase = FirebaseFirestore.instance;
  final CollectionReference theProductCollection =
  FirebaseFirestore.instance.collection("product");



  int page = 0;
  int currentPage = 0;
  late Timer _timer;
  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentPage < 5) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  void increment() => count.value++;

  addProduct(Product productData) async {
    await theDatabase.collection("product").add(productData.toMap()).whenComplete(() => Fluttertoast.showToast(msg: "New Product added!"));
  }

  updateProduct(Product productData) async {
    await theDatabase.collection("product").doc(productData.productID).update(productData.toJson());
  }

  Future<void> deleteProduct(String documentId) async {
    await theDatabase.collection("product").doc(documentId).delete();

  }

  Future<void> getProduct(String documentId) async {
    await theDatabase.collection("product").doc(documentId).get();

  }

  Future<DocumentSnapshot> getCats() async{
    DocumentSnapshot theDoc = await FirebaseFirestore.instance.collection("productCategory").doc("w4YFPY2VJaToERIU60rL").get();
    return theDoc;
  }

  Future<List<Product>> retrieveProducts() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await theDatabase.collection("product").get();
    return snapshot.docs
        .map((docSnapshot) => Product.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

}
