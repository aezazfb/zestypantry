import 'package:get/get.dart';

cartItem(dynamic mappedProduct){
  var theItem = {"name": mappedProduct.name,
    "quantity": mappedProduct.quantity,
    "expiry": mappedProduct.expiry,
    "quality": mappedProduct.quality,
    "categoryID": mappedProduct.categoryID,
    "description": mappedProduct.description,
    "price": mappedProduct.price,
    "productID": mappedProduct.productID,
    "sellerID": mappedProduct.sellerID,
    "productImage": mappedProduct.productImage,
    "unit": mappedProduct.unit,
    "inStock": mappedProduct.inStock,
    "itemCountInCart": 1};

  return theItem;
}

