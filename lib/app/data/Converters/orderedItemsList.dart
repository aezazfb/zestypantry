import 'package:get/get.dart';

orderedItemsList(RxList cartItems){
  List orderedItems = [];
  for(int i=0; cartItems.length > i; i++){
    dynamic item = cartItems[i];
    Map obj = {
      "ItemName" : item['name'],
      "Quantity" : item['itemCountInCart'],
      "ItemPrice" : item['price'],
      "SellerID" : item['sellerID'],
      "ProductID" : item['productID'],
    };
    orderedItems.add(obj);
  }
  return orderedItems;
}