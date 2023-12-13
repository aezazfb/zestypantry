import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zestypantry/app/modules/Cart/views/cart_view.dart';
import 'package:zestypantry/app/modules/home/views/home_view.dart';
// import 'package:testing_figma/pages/cart_page.dart';
// import 'package:testing_figma/pages/main_menu.dart';
// import 'package:testing_figma/pages/searchItemsListPage.dart';

class BottomNavigationBarZp extends StatelessWidget {
  const BottomNavigationBarZp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(72)),
        color: Color.fromRGBO(246, 232, 232, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(width: 20,),
          Container(
            decoration: BoxDecoration(),
            padding:
            EdgeInsets.symmetric(horizontal: 0, vertical: 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Icon(Icons.home_outlined, size: 27,),
                IconButton(icon: Icon(
                  Icons.home_outlined, size: 27,), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
                },),
                SizedBox(height: 0),
                Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(194, 143, 143, 1),
                      // fontFamily: 'Poppins',
                      fontSize: 10,
                      letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ],
            ),
          ),
          SizedBox(width: 50),
          Container(
            decoration: BoxDecoration(),
            padding:
            EdgeInsets.symmetric(horizontal: 0, vertical: 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(icon: Icon(
                  Icons.search_rounded, size: 27,), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
                },),
                SizedBox(height: 0),
                Text(
                  'Explore',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      // fontFamily: 'Poppins',
                      fontSize: 10,
                      letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ],
            ),
          ),
          SizedBox(width: 50),
          Container(
            decoration: BoxDecoration(),
            padding:
            EdgeInsets.symmetric(horizontal: 0, vertical: 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Icon(Icons.shopping_cart_outlined, size: 27,),
                IconButton(icon: Icon(
                  Icons.shopping_cart_outlined, size: 27,), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartView()));
                },),
                SizedBox(height: 0),
                Text(
                  'My Cart',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      // fontFamily: 'Poppins',
                      fontSize: 10,
                      letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ],
            ),
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
