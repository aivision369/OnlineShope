import 'package:flutter/material.dart';

import '../../con_color.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key, required this.isDarkMode}) : super(key: key);

  final bool isDarkMode;

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  int selectedIndex = 0; // Initialize with -1 to indicate no selection
  final categoryList = [
    "Recommended",
    "Hot Trending",
    "Top",
    "Rating",
    "Latest",
    "Most Searched"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                  child: Center(
                    child: Text(
                      categoryList[index],
                      style: TextStyle(
                          color: selectedIndex == index
                              ? kMenuSelected
                              : widget.isDarkMode
                                  ? Colors.white
                                  : Colors.grey,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
