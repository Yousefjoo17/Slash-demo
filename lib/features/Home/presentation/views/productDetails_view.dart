import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/widgets/custom_loading_indicator.dart';
import 'package:slash/core/widgets/custome_error_widget.dart';
import 'package:slash/features/Home/presentation/view_models/cubit/product_details_cubit.dart';
import 'package:slash/features/Home/presentation/view_models/selecting_image_cubit/selecting_image_cubit.dart';
import 'package:slash/features/Home/presentation/views/widgets/Colors_ListView.dart';
import 'package:slash/features/Home/presentation/views/widgets/ImagesListViewSmall.dart';
import 'package:slash/features/Home/presentation/views/widgets/Items_listView.dart';
import 'package:slash/features/Home/presentation/views/widgets/ProductDescription.dart';
import 'package:slash/features/Home/presentation/views/widgets/imagesListViewBig.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final CarouselController controllerBig = CarouselController();
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Product details       ",
          ),
        ),
      ),
      body: BlocBuilder<SelectingImageCubit, SelectingImageState>(
        builder: (context, state) {
          return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProductDetailsSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: SizedBox(height: 32)),
                      SliverToBoxAdapter(
                        child: ImagesListViewBig(
                          imagesUrls: state
                              .product.variations![curr].productVarientImages!
                              .map<String>((image) => image.imagePath as String)
                              .toList(),
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
                                imagesUrls: state.product.variations![curr]
                                    .productVarientImages!
                                    .map<String>(
                                        (image) => image.imagePath as String)
                                    .toList(),
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
                                Column(
                                  children: [
                                    const SizedBox(height: 32),
                                    Text(
                                      "${state.product.name}",
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "EGP ${state.product.variations![curr].price}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 48),
                                    const Text(
                                      "Select Color",
                                      style: TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Image.network(
                                  state.product.brandImage!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ColorListView(
                              colors: state.product.variations![curr]
                                  .productVarientImages!
                                  .map<String>(
                                      (image) => image.imagePath as String)
                                  .toList(),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              "Select size",
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ItemsListView(
                                array: state.product.avaiableProperties
                                    ?.where((property) =>
                                        property.property == "Size")
                                    .expand((property) => property.values ?? [])
                                    .map((value) => value?.value ?? "")
                                    .toList()),
                            const SizedBox(height: 32),
                            const Text(
                              "Select material",
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ItemsListView(
                                array: state.product.avaiableProperties
                                    ?.where((property) =>
                                        property.property == "Materials")
                                    .expand((property) => property.values ?? [])
                                    .map((value) => value?.value ?? "")
                                    .toList()),
                            const SizedBox(height: 32),
                            ProductDescription(
                                desc: state.product.description!),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is ProductDetailsFailure) {
                return CustomErrorWidget(errMessage: state.errMessage);
              } else {
                return const Center(child: CustomloadingIndicatorWidget());
              }
            },
          );
        },
      ),
    );
  }
}
