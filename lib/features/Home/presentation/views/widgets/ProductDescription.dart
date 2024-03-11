import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    "this is a description",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff1C1C1C),
        ),
        child: const Row(
          children: [
            Spacer(flex: 1),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            Spacer(flex: 2),
            Icon(Icons.arrow_back),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
