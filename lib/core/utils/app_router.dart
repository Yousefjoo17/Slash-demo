import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:slash/features/products/presentation/view_models/selecting_image_cubit/selecting_image_cubit.dart';
import 'package:slash/features/products/presentation/views/Allproducts_view.dart';
import 'package:slash/features/products/presentation/views/productDetails_view.dart';
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
          child: const ProductDetailsView(),
        ),
      ),
    ],
  );
}
