import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.isActive, required this.text});
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(255, 67, 199, 71),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : Container(
            height: 60,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff19191E),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
  }
}

class ItemsListView extends StatefulWidget {
  const ItemsListView({super.key, required this.array});

  final List<dynamic>? array;
  @override
  State<ItemsListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ItemsListView> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.array!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () {
                currIndex = index;
                setState(() {});
              },
              child: Item(
                isActive: currIndex == index,
                text: widget.array![index].toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
