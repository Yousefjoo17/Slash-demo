import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:slash/features/products/presentation/views/widgets/imagesListView.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  List<String> imagURLs = [
    "https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fproduct-variants%2F1696611895095image_picker_F93AE8A1-0BA7-4635-8F06-1E0BBFB6DABA-7927-000000C6EFC1A9A5.jpg?alt=media&token=13e079f9-5ad5-4067-94f0-b6a12437f59e",
    "https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fproduct-variants%2F1696611895095image_picker_D76B9849-51FD-4E5C-909D-247A17D8C0DD-7927-000000C6FC42F3F5.jpg?alt=media&token=7d4d1bb6-40dc-4968-9c77-b453e5955713",
    "https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fproduct-variants%2F1696611895096image_picker_5A25C10D-913A-4793-BBE6-E872B78ADCDF-7927-000000C70467A177.jpg?alt=media&token=c0ce5c2d-5b7a-471d-b621-6a0cd6cd114f",
    "https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fbrands%2F1695465676086image_picker_236F0924-0F0D-410D-9317-EC88FEC5E9B9-31877-0000033F4E46F568.png?alt=media&token=8116a469-133c-490b-a95b-14789204ea5e",
  ];
  final CarouselController controllerBig = CarouselController();
  final CarouselController controllerSmall = CarouselController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Product details       ",
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(
            child: ImagesListViewBig(
              imagesUrls: imagURLs,
              controller: controllerBig,
            ),
          ),
          SliverToBoxAdapter(
            child: IconButton(
                onPressed: () {
                  setState(() {
                    controllerBig.animateToPage(3);
                  });
                },
                icon: const Icon(Icons.abc)),
          ),
          SliverToBoxAdapter(
            child: ImagesListViewSmall(
              imagesUrls: imagURLs,
              controller: controllerSmall,
            ),
          )
        ],
      ),
    );
  }
}
