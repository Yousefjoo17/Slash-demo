import 'package:flutter/material.dart';
import 'package:slash/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 24,
            backgroundColor: color,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                currIndex = index;
                //BlocProvider.of<AddNoteCubit>(context).color =KcolorsList[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: currIndex == index,
                color: kColorsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
