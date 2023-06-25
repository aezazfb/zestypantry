import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsCollection extends StatelessWidget {
  const WidgetsCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => const Text("count : ${"controller.count"}")),
          const Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),






          ElevatedButton(onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Delete Entry'),
                  content: const Text('Do you want to delete this record?'),
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          Fluttertoast.showToast(msg: "yes");
                        })
                  ],
                ));
          }, child: Container(
            color: Colors.black,
          ))
        ],
      ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Bounce(
              duration: const Duration(milliseconds: 95),
              onPressed: () {
                Fluttertoast.showToast(msg: "Horaa hai bounce!");
              },
              child: ListTile(
                title: Obx(() => const Text("count : ")),
                subtitle: const Text("Price: "),
                leading: const CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      "https://images.unsplash.com/photo-1516368703560-076d597296a9",
                    )),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: true
                                ? Colors.black
                                : Colors.white,
                          ),
                          onPressed: () {

                          }),
                      IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: true
                                ? Colors.black
                                : Colors.white,
                          ),
                          onPressed: () async {}),
                    ],
                  ),
                ),
              ),
            );
          },
        ),


        //Card
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Bounce(
            duration: const Duration(milliseconds: 95),
            onPressed: () {

            },
            child: Card(
              color: true
                  ? Colors.white
                  : Colors.grey.shade900,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        child: CachedNetworkImage(
                          imageUrl: "https://images.unsplash.com/photo-1516368703560-076d597296a9",
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
                                  "tiTle!",
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
                                ' Starting From Rs: 25',
                                style: GoogleFonts.lato(
                                  color: true
                                      ? Colors.black
                                      : Colors.white,
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
                                color: true
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5 Days 7 Nights',
                                style: GoogleFonts.lato(
                                  color: true
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade300,
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

          itemCount: 6,
        ),



        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {

                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 81,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: true
                                  ? BorderRadius.circular(15)
                                  : BorderRadius.circular(10),
                              border: true
                                  ? Border.all(
                                  color:
                                  true
                                      ? Colors.black87
                                      : Colors.white,
                                  width: 2)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                "items[index]",
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: true
                                        ? true
                                        ? Colors.black
                                        : Colors.grey
                                        : true
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: true,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: true
                                      ? Colors.black
                                      : Colors.white,
                                  shape: BoxShape.circle),
                            )),
                      ],
                    );
                  }),
            ),

          ],
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Bounce(
            duration: const Duration(milliseconds: 95),
            onPressed: () {

            },
            child: Card(
              color: true
                  ? Colors.white
                  : Colors.grey.shade900,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        child: CachedNetworkImage(
                          imageUrl: "https://images.unsplash.com/photo-1516368703560-076d597296a9",
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
                                  "tiTle!",
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
                                ' Starting From Rs: 25',
                                style: GoogleFonts.lato(
                                  color: true
                                      ? Colors.black
                                      : Colors.white,
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
                                color: true
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5 Days 7 Nights',
                                style: GoogleFonts.lato(
                                  color: true
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade300,
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

          itemCount: 6,
        )

      ],
    );
  }
}
