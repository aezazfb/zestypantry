import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zestypantry/app/data/models/itemAvailable.dart';

abstract class IGlobalFunctions {
  int totalItemsInCart(RxList cartItems);
  Future<ItemAvailable> itemQuantityCheck(String productID);
  Future<ItemAvailable> itemQuantityCheckForOrder(String productID, int itemQuantityInCart);
}

class GlobalFunctions implements IGlobalFunctions{
  final FirebaseFirestore theDatabase = FirebaseFirestore.instance;

  @override
  int totalItemsInCart(RxList cartItems) {
    // TODO: implement totalItemsInCart
    num totalItemsInCart = 0;
    for(int i=0; cartItems.length > i; i++){
      totalItemsInCart += cartItems[i]["itemCountInCart"];
    }
    return totalItemsInCart.toInt();
  }

  @override
  Future<ItemAvailable> itemQuantityCheck(String productID) async{
    //bool itemAvailability = true;
    // bool stockAvailable;
    // int itemStockQuantity;
    DocumentSnapshot theDoc = await theDatabase.collection("product").doc(productID).get();
    bool stockAvailable = theDoc.get("inStock") ?? false;
    int itemStockQuantity = theDoc.get("quantity") ?? 0;

    ItemAvailable result = ItemAvailable(stockAvailable, itemStockQuantity);

    return result;
  }

  @override
  Future<ItemAvailable> itemQuantityCheckForOrder(String productID, int itemQuantityInCart) async{
    bool itemAvailability = true;

    DocumentSnapshot theDoc = await theDatabase.collection("product").doc(productID).get();
    //bool stockAvailable = theDoc.get("inStock") ?? false;
    int itemStockQuantity = theDoc.get("quantity") ?? 0;

    if(itemStockQuantity < itemQuantityInCart){
      itemAvailability = false;
    }

    ItemAvailable result = ItemAvailable(itemAvailability, itemStockQuantity);

    return result;
  }

}