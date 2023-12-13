import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:zestypantry/app/modules/mainmenu/widgets/main_menu_card.dart';
import 'package:zestypantry/app/modules/mainmenu/widgets/menu_tile.dart';
import 'package:zestypantry/app/routes/app_pages.dart';

import '../../../../PersonalWidgets/ZPBottomNavigationBar.dart';
import '../controllers/mainmenu_controller.dart';

class MainmenuView extends GetView {
  const MainmenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var wMultiplier = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/images/zpback.svg',
                semanticsLabel: 'zpback',
                width: wMultiplier * 0.99,
              )
          ),
          Positioned(
              top: 55,
              left: 17,
              // width: wMultiplier * 0.95,
              child: Padding(padding: const EdgeInsets.all(5),
                child: Text('ZESTY PANTRY', textAlign: TextAlign.left, style: GoogleFonts.irishGrover(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    // fontFamily: 'MedievalSharp',
                    fontSize: 37,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),
                ),
              )
          ),
          const Positioned(
              left: 50,
              top: 120,
              right: 50,
              child: Divider(
                thickness: 5,

              )),
          Positioned(
              left: 25,
              top: 130,
              right: 25,
              bottom: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    MainMenuCard(title: "Food",
                      subHeading: "Fresh and Healthy Homemade food and drinks",),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (){
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescriptionPage()));
                        Get.toNamed(Routes.HOME);
                      },
                      child: MainMenuCard(title: "GrocerY",
                        subHeading: "Company Items",),
                    ),
                    const SizedBox(
                      height: 10,
                    ),MainMenuCard(title: "SPECIAL\nBREAKFAST",
                      subHeading: "Zianab test ajasj nasdaasdnasdlnlad ",),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
          ),
          Positioned.fill(
              bottom: 5,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: const BottomNavigationBarZp()))
        ],
      ),
      // bottomNavigationBar: const BottomNavigationBarZp(),
    );
  }
}
