import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zestypantry/PersonalWidgets/AddProductWidget.dart';
import 'package:zestypantry/app/modules/item/ItemWidgets/ItemCard.dart';
import 'package:zestypantry/app/modules/home/home_view_widgets/imgCurson.dart';
import 'package:zestypantry/app/data/models/product_model.dart';
import 'package:zestypantry/app/modules/Cart/views/cart_view.dart';
import 'package:zestypantry/app/modules/home/home_view_widgets/home_bottom_bar.dart';
import 'package:zestypantry/globalVariables.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int page = 0;

  dynamic theProducts;

  final CollectionReference _red =
  FirebaseFirestore.instance.collection("product");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => Visibility(
        visible: cartItemsCount >= 1,
        child: FloatingActionButton(


          onPressed: () {
            Fluttertoast.showToast(msg: "View Cart! ");
            Get.toNamed("/cart");
            // Get.to(const CartView());


            // showDialog(context: context, builder: (BuildContext build){
            //   return AddProductWidget();
            // },);
            // controller.increment();
            //
            // controller.addEmployee(Product(name: "checkign!",
            // quantity: 57,
            // quality: "Jabardast"));


          },
          backgroundColor: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text("${cartItemsCount.value}"),),
              const Icon(Icons.shopping_cart),
            ],
          ),
        ),
      )),
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AutoImageScrolling(),

            // HomePagePost(
            //   itemName: "TestProduct",
            //   itemPrice: "51k",
            //   itemUnit: "Kg",
            // ),
            StreamBuilder(
              stream: _red.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> theSnap) {
                theProducts = theSnap.data?.docs.toList();

                int theProductsCount = 0;
                if (theSnap.hasData) {
                  theProductsCount = theSnap.data!.docs.length;
                  productsCount.value = theProductsCount;
                }



                return theSnap.hasData ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child:  const Text(
                           "Menu",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GridView.count(crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        shrinkWrap: true,
                        children: [
                          for(int index = 0; index <= theProductsCount - 1; index++)
                            HomePagePost(itemName: theProducts[index]["name"].toString(),
                            theItem: theProducts[index],)
                        ],)
                    ],
                  ),
                ) : const CircularProgressIndicator();
              }
            ),




            const SizedBox(
              height: 20,
            ),


          ],
        ),
      ),
      //bottomNavigationBar: const HomeBottomBar(),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
