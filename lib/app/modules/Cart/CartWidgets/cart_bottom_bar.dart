import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Container(
      height: 123,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
            color: Colors.black12.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5
        )],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(Icons.discount_rounded),
                Text("Use Promo",
                  style: TextStyle(
                      color: Color.fromARGB(162, 0, 0, 0),
                      fontWeight: FontWeight.bold
                  ),),
              ],
            ),
          ),
          Divider(
            height: 25,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total",
                    style: TextStyle(
                        color: Color.fromARGB(162, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 23
                    ),),
                  Text("\$153",
                    style: TextStyle(
                        color: Color(0xFFFFB608),
                        fontWeight: FontWeight.bold,
                        fontSize: 21
                    ),),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "orderPage");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFB608),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Text("Check Out",
                    style: TextStyle(
                        color: Color.fromARGB(162, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 23
                    ),),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}