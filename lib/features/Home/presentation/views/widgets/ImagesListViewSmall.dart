import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/Home/presentation/view_models/selecting_image_cubit/selecting_image_cubit.dart';

class ImagesListViewSmall extends StatelessWidget {
  const ImagesListViewSmall({
    Key? key,
    required this.imagesUrls,
    required this.controllerBig,
  }) : super(key: key);

  final List<String> imagesUrls;
  final CarouselController controllerBig;

  @override
  Widget build(BuildContext context) {
    int i = BlocProvider.of<SelectingImageCubit>(context).currIndex;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagesUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<SelectingImageCubit>(context).changePic(index);
            controllerBig.animateToPage(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color:
                    index == i ? const Color.fromARGB(255, 4, 255, 12) : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imagesUrls[index],
                  width: 50,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
