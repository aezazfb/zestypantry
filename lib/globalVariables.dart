import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxBool isFav = false.obs;
RxBool cartButtonView = false.obs;
RxInt productsCount = 0.obs;
RxList cartItems = [].obs;
RxInt cartTotalItems = 0.obs;
RxInt cartSubTotal = 0.obs;
RxInt discountAmount = 0.obs;
double serviceChargePc = 0.07;
RxInt serviceCharges = 0.obs;
RxInt totalOrderCharges = 0.obs;


Color? themeBackGroundColor = const Color.fromRGBO(253, 121, 168, 1);
Color? themeBtnColor = const Color.fromRGBO(253, 121, 168, 1);
Color? themeBtnColorNoConst = Color.fromRGBO(253, 121, 168, 1);

 mapMyProduct(dynamic data){
  String? name;
  int? quantity;
  String? expiry;
  String? quality;
  int? categoryID;
  String? description;
  int? price;
  String? productID;
  int? sellerID;
  String? productImage;
  String? unit;
  bool? inStock;

  data['name'] = name;
  data['quantity'] = quantity;
  data['expiry'] = expiry;
  data['quality'] = quality;
  data['categoryID'] = categoryID;
  data['description'] = description;
  data['price'] = price;
  data['productID'] = productID;
  data['sellerID'] = sellerID;
  data['productImage'] = productImage;
  data['unit'] = unit;
  data['inStock'] = inStock;

  return {name,
    quantity,
    expiry,
    quality,
    categoryID,
    description,
    price,
    productID,
    sellerID,
  productImage,
  unit,
  inStock};
}

RxString thisDeviceFCMToken = ''.obs;

String adminDeviceFcm = 'co8z9POcRu2Hld0hYD0GP1:APA91bEzSzz1MlJrty-P5pqiANQQYNkvTviFTjQllo6bDvdmImsQSQJXfeA5ZOLd2Lf9q0xLAgnaysOTfXPVLvtdFGYFjrQef8W8Ao6q1ap2KtII5Y1x9qZ0zQu47IIdG1iAVkmcORGG';