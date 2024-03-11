import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.image,
  });
  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: Image.network(image))
        : CircleAvatar(radius: 24, child: Image.network(image));
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key, required this.colors});
  final List<String>? colors;

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (widget.colors!.length / 2).floor(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                c = index;
                setState(() {});
              },
              child: ColorItem(
                isActive: c == index,
                image: widget.colors![index],
              ),
            ),
          );
        },
      ),
    );
  }
}
