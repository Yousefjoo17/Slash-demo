import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:slash/core/utils/service_locator.dart';
import 'package:slash/features/Home/data/repos/Home_repo_imp.dart';
import 'package:slash/features/Home/presentation/view_models/All_products_cubit/all_products_cubit.dart';
import 'package:slash/features/Home/presentation/view_models/cubit/product_details_cubit.dart';
import 'package:slash/features/Home/presentation/view_models/selecting_image_cubit/selecting_image_cubit.dart';
import 'package:slash/features/Home/presentation/views/allproducts_view.dart';
import 'package:slash/features/Home/presentation/views/productDetails_view.dart';
import 'package:slash/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kAllProductsView = '/allproductsview';
  static const String kProductDetailsView = '/productDetailView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kAllProductsView,
        builder: (context, state) => const AllProductsView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SelectingImageCubit(0),
          child: BlocProvider(
            create: (context) => ProductDetailsCubit(getIt.get<HomeRepoImpl>())
              ..fetchProdDetails(
                  BlocProvider.of<AllProductsCubit>(context).currID),
            child: const ProductDetailsView(),
          ),
        ),
      ),
    ],
  );
}
