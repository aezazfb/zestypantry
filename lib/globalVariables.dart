import 'package:get/get.dart';

RxBool isFav = false.obs;
RxBool cartButtonView = false.obs;
RxInt cartItemsCount = 0.obs;
RxInt productsCount = 0.obs;
RxList cartItems = [].obs;
RxList cartAddedItems = [].obs;
RxInt currentItemCount = 1.obs;

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