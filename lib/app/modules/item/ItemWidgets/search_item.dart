import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/product_model.dart';

class SearchPageItem extends StatelessWidget {
   SearchPageItem(
      {required this.itemName,
        this.itemPrice,
        this.itemQuantity,
        this.itemImage,
        this.itemUnit,
        this.postTitle,
        this.theItem,
        Key? key}) : super(key: key);

  final dynamic theItem;
  final String itemName;
  final String? itemPrice;
  final String? itemQuantity;
  final String? itemUnit;
  final String? itemImage;
  final String? postTitle;

  dynamic mappedProduct;

  @override
  Widget build(BuildContext context) {
    if(theItem!=  null){
      mappedProduct = Product.fromDocumentSnapshot(theItem);
    }
    Random random = Random();
    List<Alignment> randomAlignment = [Alignment.bottomRight, Alignment.bottomRight, Alignment.topRight, Alignment.topLeft, ];
    return Container(
      height: 150,
      width: 130,
      // color: Colors.green,
      padding: EdgeInsets.zero,
      child: Stack(
        // fit: StackFit.expand,
        // alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            // top: 50,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(7),
                width: 140,
                height: 200,
                decoration: ShapeDecoration(
                  color: Color(0xFFC28F8F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Text(overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      "$itemName / ${mappedProduct.unit ?? itemUnit ?? "item"}",//'Pizza Corns (Small) With Cheese and Pepper',
                      style: GoogleFonts.alegreya(
                        color: Colors.white,
                        fontSize: 21,
                        // fontFamily: 'Alegreya',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      "Rs ${mappedProduct.price ?? itemPrice ?? "100"}",
                      style: GoogleFonts.alegreya(
                        color: Colors.white,
                        fontSize: 25,
                        // fontFamily: 'Alegreya',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
              top: 0,
              // bottom: 0,
              // left: 10,
              // right: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(3),
                  height: 100,
            width: 100,
            decoration: ShapeDecoration(
                color: Color.fromRGBO(122, 90, 90, 1),
                shape: CircleBorder(),

            ),
                  child: Align(
                    alignment: randomAlignment[random.nextInt(4)],
                    child: CircleAvatar(
                      radius: 43,
                      backgroundColor: Color.fromRGBO(122, 90, 90, 0),
                      backgroundImage: AssetImage("assets/images/ebb.jpg"),
                    ),
                  ),
          ),
              )),
          Positioned.fill(
              bottom: 15,
              // left: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.amber
                    ),
                    child: IconButton.filled(onPressed: (){}, icon: Icon(Icons.add_shopping_cart_rounded))),
              )
          )
        ],
      ),
    );
  }
}
