import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slash/core/utils/app_router.dart';
import 'package:slash/core/utils/assets_data.dart';
import 'package:slash/features/splash/presentation/views/widgets/Sliding_Text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; //0:1
  late Animation<Offset> slidingAnimation; //0: .......
  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    // whenever you use controller use dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.slashLogo),
          const SizedBox(height: 6),
          SlidingText(
              slidingAnimation: slidingAnimation, text: 'All you need is here'),
        ],
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////////

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kAllProductsView);
    });
  }
}
