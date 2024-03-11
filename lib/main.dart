import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/utils/app_router.dart';
import 'package:slash/core/utils/service_locator.dart';
import 'package:slash/features/products/data/repos/Home_repo_imp.dart';
import 'package:slash/features/products/presentation/view_models/All_products_cubit/all_products_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllProductsCubit(
            getIt.get<HomeRepoImpl>(),
          )..featchAllProducts(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        title: 'Slash demo',
      ),
    );
  }
}
