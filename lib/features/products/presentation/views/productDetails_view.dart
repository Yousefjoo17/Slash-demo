import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/products/presentation/view_models/selecting_image_cubit/selecting_image_cubit.dart';
import 'package:slash/features/products/presentation/views/widgets/Colors_ListView.dart';
import 'package:slash/features/products/presentation/views/widgets/ImagesListViewSmall.dart';
import 'package:slash/features/products/presentation/views/widgets/imagesListViewBig.dart';

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
      body: BlocBuilder<SelectingImageCubit, SelectingImageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                SliverToBoxAdapter(
                  child: ImagesListViewBig(
                    imagesUrls: imagURLs,
                    controller: controllerBig,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Spacer(flex: 1),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: ImagesListViewSmall(
                          imagesUrls: imagURLs,
                          controllerBig: controllerBig,
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Column(
                            children: [
                              SizedBox(height: 12),
                              Text(
                                "Cargo pants",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "EGP 550",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 32),
                              Text(
                                "Select Color",
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/slash-d7546.appspot.com/o/images%2Fbrands%2F1695386914229FB_IMG_1693330052710.jpg?alt=media&token=501cb71f-ed98-4348-b2e8-41c63e272e32",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const ColorListView()
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
