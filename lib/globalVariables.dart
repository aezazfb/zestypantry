import 'package:get/get.dart';

RxBool isFav = false.obs;
RxBool cartButtonView = false.obs;
RxInt productsCount = 0.obs;
RxList cartItems = [].obs;
RxInt cartSubTotal = 0.obs;
RxInt discountAmount = 0.obs;
double serviceChargePc = 0.07;
RxInt serviceCharges = 0.obs;
RxInt totalOrderCharges = 0.obs;

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