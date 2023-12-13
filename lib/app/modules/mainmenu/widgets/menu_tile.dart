import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zestypantry/app/routes/app_pages.dart';

class MenuTIle extends StatelessWidget {
   MenuTIle({Key? key, required this.title, required this.routeName, this.subheading}) : super(key: key);
   String title;
   String routeName;
   String? subheading;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 95),
      onPressed: () {
        Fluttertoast.showToast(msg: "HI");
        Get.toNamed(routeName);
      },
      child: Card(
        margin: const EdgeInsets.only(top: 5,bottom: 5, left: 70, right: 70),
        color: const Color.fromRGBO(253, 121, 168, 1),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        //margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                // child: CachedNetworkImage(
                //   imageUrl: 'assets/imgs/doingGrocery.png',
                //   height: 200,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                //   filterQuality: FilterQuality.high,
                //   placeholder: (context, url) => const Center(
                //     child: CircularProgressIndicator(),
                //   ),
                //   errorWidget: (context, url, error) =>
                //   const Icon(Icons.error),
                // ),
                child: Image.asset('assets/imgs/doingGrocery.png',
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
