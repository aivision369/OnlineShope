import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../con_color.dart';
import '../item_model.dart';

class CustomGridItem extends StatefulWidget {
  const CustomGridItem(
      {Key? key, required this.index, required this.isDarkMode})
      : super(key: key);
  final int index;
  final bool isDarkMode;

  @override
  State<CustomGridItem> createState() => _CustomGridItemState();
}

class _CustomGridItemState extends State<CustomGridItem> {
  @override
  Widget build(BuildContext context) {
    final index = widget.index;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: Container(
                height: 120,
                decoration: BoxDecoration(

                    ///color: widget.isDarkMode ? Colors.white : Color(0xFFf9d2c7),
                    color: Color(0xFFf9d2c7),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                margin: EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${ItemModel.itemList[index].name}',
                            style: TextStyle(
                              color: kMenuSelected /*Colors.white*/,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${ItemModel.itemList[index].price}',
                            style: TextStyle(
                              color: kMenuSelected,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${ItemModel.itemList[index].series}',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 10,
                        ratingWidget: RatingWidget(
                            full: Image.asset(
                              "assets/images/ic_selected_star.png",
                            ),
                            half: Image.asset(
                              "assets/images/ic_selected_star.png",
                            ),
                            empty: Image.asset(
                              "assets/images/ic_unselected_star.png",
                            )),
                        itemPadding: EdgeInsets.symmetric(horizontal: 3),
                        onRatingUpdate: (rating) {
                          print("Rating :$rating");
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
          ),
          Positioned(
              top: 0,
              // Adjust this value to align with half of the image height
              left: -10,
              // Adjust this value to position the image horizontally
              right: 0,
              child: Image.asset(
                "${ItemModel.itemList[index].image}",
                width: 90,
                height: 90,
              ))
        ],
      ),
    );
  }
}
