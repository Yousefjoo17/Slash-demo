import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/Home/presentation/view_models/selecting_image_cubit/selecting_image_cubit.dart';

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
                  fit: BoxFit.none,
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
          BlocProvider.of<SelectingImageCubit>(context).changePic(index);
        },
      ),
      carouselController: controller,
    );
  }
}
