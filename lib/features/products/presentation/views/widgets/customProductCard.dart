import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slash/core/utils/app_router.dart';
import 'package:slash/core/utils/assets_data.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProductDetailsView);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 0,
                  offset: const Offset(5, 0),
                )
              ],
            ),
            child: Card(
              color: const Color.fromARGB(255, 23, 22, 22),
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Interns-Hijab Light",
                      style: TextStyle(fontSize: 19),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "EGP 500",
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_outline),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            //bottom: 50,
            left: 10,
            child: SizedBox(
              width: 60,
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  AssetsData.test,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
