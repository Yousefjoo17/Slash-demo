import 'package:flutter/material.dart';

class ImagesListViewSmall extends StatelessWidget {
  const ImagesListViewSmall({
    Key? key,
    required this.imagesUrls,
  }) : super(key: key);

  final List<String> imagesUrls;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagesUrls.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 2) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 255, 12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imagesUrls[index],
                  width: 50,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imagesUrls[index],
                width: 50,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      },
    );
  }
}
