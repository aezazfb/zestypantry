import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zestypantry/PersonalWidgets/ZPBottomNavigationBar.dart';
import 'package:zestypantry/app/modules/home/controllers/home_controller.dart';
import 'package:zestypantry/app/modules/item/ItemWidgets/search_item.dart';
import 'package:zestypantry/globalVariables.dart';

class SearchItemsListPage extends StatefulWidget {
  SearchItemsListPage({Key? key}) : super(key: key);

  @override
  State<SearchItemsListPage> createState() => _SearchItemsListPageState();
}

class _SearchItemsListPageState extends State<SearchItemsListPage> {
  dynamic theProducts;

  String searchTxt = '';
  String categoryTxt = 'Categories';
  int categoryId = 0;

  TextEditingController searchController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();

  final CollectionReference catsRef = FirebaseFirestore.instance.collection("productCategory");



  final CollectionReference _red =
      FirebaseFirestore.instance.collection("product");

  bool catsVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _red.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> theSnap) {
            // theProducts = theSnap.data?.docs.toList();
            // if (searchTxt.isNotEmpty) {
            //   Fluttertoast.showToast(msg: "Not empty search");
            //   theProducts = theSnap.data?.docs.where((element) {
            //     return element
            //         .get('name')
            //         .toString()
            //         .toLowerCase()
            //         .contains(searchTxt.toLowerCase());
            //   }).toList();
            // }


            int theProductsCount = 0;
            if (theSnap.hasData) {
              theProducts = theSnap.data?.docs.where((element) {

                if(categoryId != 0 && searchTxt.isNotEmpty){
                  return element
                      .get('categoryID')
                      .toString()
                      .toLowerCase().contains(categoryId.toString()) && element
                      .get('name')
                      .toString()
                      .contains(searchTxt.toLowerCase());
                }
                if(categoryId != 0){
                  return element
                      .get('categoryID')
                      .toString()
                      .toLowerCase()
                      .contains(categoryId.toString());
                }
                return element
                    .get('name')
                    .toString()
                    .toLowerCase()
                    .contains(searchTxt.toLowerCase());
              }).toList();

              theProductsCount = theSnap.data!.docs.length;
              productsCount.value = theProductsCount;
            }

            //todo Documents list added to filterTitle

            return Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEBBFBF),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          top: 50,
                          left: 15,
                          right: 15,
                          child: Container(
// width: 365,
                            height: 170,
                            decoration: ShapeDecoration(
                              color: const Color.fromRGBO(246, 232, 232, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
//Search
                                Positioned (
                                  right: 5,
                                  top: 5,
                                  width: 200,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: TextField(
                                      controller: searchController,
                                      cursorHeight: 20,
                                      onChanged: (e) {
                                        setState(() {
                                          searchTxt = e;
                                        });
                                      },
                                      cursorColor: Colors.black,
                                      cursorRadius: const Radius.circular(5),
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              const Icon(Icons.search_outlined),
                                          prefixIconColor: Colors.black,
                                          focusedBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(70)),
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          hintText: "Search",
                                          contentPadding: const EdgeInsets.all(-2),
                                          hintStyle: GoogleFonts.poppins(
                                            color: const Color(0xFFD6ADAD),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          iconColor: Colors.black,
                                          // icon: Icon(Icons.search_outlined),
                                          // focusColor: Color(0xFFEBBFBF),
                                          fillColor: const Color(0xFFEBBFBF),
                                          filled: true,
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(70)),
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 57,
                                    left: 20,
                                    child: Text(
                                      'Trending Foods ',
                                      style: GoogleFonts.medievalSharp(
                                        color: Colors.black,
                                        fontSize: 27,
                                        // fontFamily: 'MedievalSharp',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    )),
                                Positioned(
                                    bottom: 45,
                                    left: 20,
                                    child: Container(
                                      width: 150,
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.pinkAccent.shade100,
                                              width: 1
                                          )
                                      ),
                                      child: InkWell(
                                        onTap:(){
                                          setState(() {
                                            catsVisibility = !catsVisibility;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Text(categoryTxt,
                                                style: GoogleFonts.medievalSharp(
                                                  color: Colors.black,
                                                  fontSize: 21,
                                                  // fontFamily: 'MedievalSharp',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                )),
                                            const SizedBox(width: 5,),
                                            const Spacer(),
                                            const Icon(Icons.fastfood)
                                          ],
                                        ),
                                      ),
                                    ),
                                ),
                                Positioned.fill(
                                    top: 20,
                                    right: 30,
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                            "assets/images/burger_icon.png")))
                              ],
                            ),
                          )),
                      Positioned(
                          left: 10,
                          right: 10,
                          top: 200,
                          bottom: -10,
                          child: Container(
// alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 70),
                            decoration: const ShapeDecoration(
                              color: Color(0xFFEBBFBF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(72),
                                    topLeft: Radius.circular(72)),
                              ),
                            ),
                            child: (theSnap.hasData && theProducts.length == 0) ?
                            const Center(child: Text("Nothing like that! :/"),) :
                            (theSnap.hasData && theProducts.length > 0)
                                ? GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.only(left: 0, top: 20),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,


// physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 15,
                              ),
                              cacheExtent: 5,
                              itemCount: theSnap.hasData ? theProducts.length : 0,
                              itemBuilder: (context, index) {
                                return theSnap.hasData ? SearchPageItem(
                                  itemName:
                                      theProducts[index]["name"].toString(),
                                  theItem: theProducts[index],
                                ) : Center(child: Image.asset("/imgs/zpLogo.png"),);
                              },
                            )
                                : const Center(child: CircularProgressIndicator()),
                          )),
                      const Positioned.fill(
                          bottom: 5,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: BottomNavigationBarZp())),
                      Positioned(
                          top: 173,
                          left: 35,
                          child: StreamBuilder(stream: catsRef.snapshots(),
                            builder: (context, snapshot) {
                              //List<DropdownMenuEntry> cats = [const DropdownMenuEntry(value: 0, label: "All")];
                              var obj = snapshot.data?.docs.elementAtOrNull(0)?.get("Food");
                              List catItems = [];

                              if (snapshot.hasData) {
                                obj.entries.forEach((element) {
                                  //cats.add(DropdownMenuEntry(value: element.value, label: element.key));
                                  catItems.add([element.key, element.value]);
                                });
                                catItems.add(["All", 0]);
                                return Column(
                                children: [
                                  for(int index = 0; index < catItems.length; index++)
                                  Visibility(
                                    maintainAnimation: true,
                                    maintainState: true,
                                    visible: catsVisibility,

                                    child: AnimatedOpacity(
                                      opacity: catsVisibility ? 1 :0,
                                      duration: Duration(milliseconds: 700 +(index*100)),
                                      curve: Curves.easeInOutBack,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 5, left: 10),
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFC28F8F),
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                                color: Colors.pinkAccent.shade100,
                                                width: 1
                                            )
                                        ),
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              categoryId = catItems[index][1];
                                              if(categoryId != 0){
                                                categoryTxt = catItems[index][0];
                                              }else{
                                                categoryTxt = "Categories";
                                              }
                                              catsVisibility = false;
                                            });
                                            // Fluttertoast.showToast(msg: catItems[index][0].toString());
                                          },
                                          child: Row(
                                            children: [
                                              Text(catItems[index][0].toString(),
                                                  style: GoogleFonts.medievalSharp(
                                                    color: Colors.black,
                                                    fontSize: 21,
                                                    // fontFamily: 'MedievalSharp',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  )),
                                              const SizedBox(width: 5,),
                                              // Icon(Icons.)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              } else {
                                return const Text("Filters");
                              }
                            },)
                      ),
                    ],
                  );
          }),
    );
  }
}
