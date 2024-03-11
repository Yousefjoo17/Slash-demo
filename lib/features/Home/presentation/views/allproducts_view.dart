import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/widgets/custom_loading_indicator.dart';
import 'package:slash/core/widgets/custome_error_widget.dart';
import 'package:slash/features/Home/presentation/view_models/All_products_cubit/all_products_cubit.dart';
import 'package:slash/features/Home/presentation/views/widgets/customProductCard.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "Slash.",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            BlocBuilder<AllProductsCubit, AllProductsState>(
              builder: (context, state) {
                if (state is AllProductsSuccess) {
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return const CustomProductCard();
                    }, childCount: state.products.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 20,
                    ),
                  );
                } else if (state is AllProductsFailure) {
                  return CustomErrorWidget(errMessage: state.errMessage);
                } else {
                  return const CustomloadingIndicatorWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
