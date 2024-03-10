import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesListViewBig extends StatelessWidget {
  const ImagesListViewBig({
    super.key,
    required this.imagesUrls,
    required this.controller,
  });

  final List<String> imagesUrls;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imagesUrls
          .map(
            (item) => Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.network(
                  item,
                  fit: BoxFit.fill,
                  width: 1000,
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 1.5,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.easeInOutQuart,
        onPageChanged: (index, reason) {
          print("index: $index  reason: $reason");
        },
      ),
      carouselController: controller,
    );
  }
}
