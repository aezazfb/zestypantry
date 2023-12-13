import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zestypantry/app/routes/app_pages.dart';

class FoodMenuTile extends StatelessWidget {
   FoodMenuTile({Key? key, required this.foodName, this.pricing}) : super(key: key);
   String foodName;
   String? pricing;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      child: Bounce(
        duration: const Duration(milliseconds: 95),
        onPressed: () {
          Fluttertoast.showToast(msg: "HI");
          Get.toNamed(Routes.HOME);
        },
        child: Card(
          color: Colors.grey.shade900,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          //margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: "widget.tours[index].imageUrl[0]",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(50)),
                              color: Colors.black38),
                          child: IconButton(
                            icon: true
                                ? const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                              size: 28,
                            )
                                : const Icon(
                              Icons.favorite_border,
                              size: 26,
                              color: Colors.white,
                            ),
                            onPressed: () async {

                            },
                          )),
                    ),
                  ),
                  Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              color: Colors.black54),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              foodName,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            pricing ?? '',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timelapse,
                            size: 18,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'items',
                            style: GoogleFonts.lato(
                              color: Colors.grey.shade300,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
