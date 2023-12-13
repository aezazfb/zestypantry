import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg_flutter.dart';

class MainMenuCard extends StatelessWidget {
  MainMenuCard({Key? key, required this.title, required this.subHeading, this.imgSrc = ""}) : super(key: key);

  String title;
  String subHeading;
  String imgSrc;

  static const cardColour =  Color.fromRGBO(194, 143, 143, 1);
  double borderRadiusContainer = 19;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 370,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(19)),
          color: cardColour
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(padding: const EdgeInsets.all(3),
        child: Container(
          //color: cardColour,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(19)),
              color: cardColour
          ),
          child: Stack(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(5,7,5,57),

                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius : BorderRadius.all(Radius.circular(19)),
                      image : DecorationImage(
                          image: AssetImage('assets/images/gc.jpg'),
                          fit: BoxFit.cover
                      ),
                    )
                )
                ,),
              Positioned(
                  top: 20,
                  left: 12,
                  child: Container(
                    // width: 103,
                    // height: 37,
                    decoration: const BoxDecoration(
                      color : Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(Radius.circular(7))
                    ),
                    child: Padding(padding: EdgeInsets.fromLTRB(5,2,5,0),
                      child: Text(title, textAlign: TextAlign.left, style: GoogleFonts.medievalSharp(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          // fontFamily: 'MedievalSharp',
                          fontSize: 37,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),),
                  )
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(3, 17, 3, 5),
                      width: 354,
                      height: 109,
                      decoration: const BoxDecoration(
                        borderRadius : BorderRadius.all(
                          Radius.circular(19)
                        ),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0,4),
                            blurRadius: 4
                        )],
                        color : Color.fromRGBO(122, 89, 89, 1),
                      ),
                    child: Text(subHeading, textAlign: TextAlign.center,
                      style: GoogleFonts.lakkiReddy(
                          fontSize: 22,
                          color: Colors.white
                      ),),
                  )
              )
            ],
          ),
        ),),
    );
  }
}
