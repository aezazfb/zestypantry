import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zestypantry/app/modules/home/views/home_view.dart';


class AutoImageScrolling extends StatefulWidget {
  const AutoImageScrolling({Key? key}) : super(key: key);

  @override
  State<AutoImageScrolling> createState() => _AutoImageScrollingState();
}

class _AutoImageScrollingState extends State<AutoImageScrolling> {

  int page = 0;
  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.95,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: 6,
              onPageChanged: (value) {
                setState(() {
                  page = value;
                  _currentPage = value;
                });
              },
              itemBuilder: (context, index) => Bounce(
                duration: const Duration(milliseconds: 95),
                onPressed: () {

                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: "https://images.unsplash.com/photo-1516368703560-076d597296a9",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        filterQuality: FilterQuality.high,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                      Positioned(
                          child: Text(
                            "title",
                            style: GoogleFonts.courgette(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              child: Row(
                  children: List.generate(
                      6,
                          (index) => Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: DotIndicator(isActive: index == page),
                      ))),
            ),





          ],
        ),
      ),
    );
  }
}

