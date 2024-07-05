import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/dark_theme_preference.dart';
import 'package:online_shop/screens/widget/horizontal_list.dart';

import 'item_model.dart';
import 'widget/custom_grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, required this.onThemeChanged, required this.index})
      : super(key: key);
  final int index;
  final Function(bool) onThemeChanged;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DarkThemePreference pref = DarkThemePreference();
  bool _isDarkMode = false;

  void _onSwitchChanged(bool value) {
    setState(() {
      _isDarkMode = value;
      pref.setDarkModeTheme(value);
    });
    widget.onThemeChanged(value);
  }

  @override
  void initState() {
    super.initState();
    updateTheme();
  }

  void updateTheme() async {
    _isDarkMode = await pref.getTheme();
    _onSwitchChanged(_isDarkMode);
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            //This is ActionBar and Search View
            Row(
              children: [
                Image.asset(
                  "assets/images/ic_logo.png",
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AiVision",
                          style: TextStyle(
                              color: _isDarkMode ? Colors.white : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Online Shop",
                          style: TextStyle(
                              color: _isDarkMode ? Colors.white : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff979899),
                                      fontWeight: FontWeight.w500),
                                  contentPadding: EdgeInsets.all(15),
                                  prefixIcon: Icon(
                                    CupertinoIcons.search,
                                    color: Color(0xFFDD704F),
                                  )),
                            ),
                          ),
                          Image.asset("assets/images/ic_filter.png")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _isDarkMode = !_isDarkMode;
                        _onSwitchChanged(_isDarkMode);
                      });
                    },
                    child: Image.asset(
                      _isDarkMode
                          ? "assets/images/ic_light_mode.png"
                          : "assets/images/ic_dark_mode.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Color(0xFFdd7251), Color(0xFFf9d2c7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: RichText(
                          text: TextSpan(
                              text: "Mage Sale\nSpectacular",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                              children: [
                                TextSpan(
                                  text:
                                      "\n\nIndulge in unbeatable deals\nacross various products.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 12),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/images/ic_ad.png"),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Welcome Back, \nClaudia Alves!",
                            style: TextStyle(
                                fontSize: 25,
                                color:
                                    _isDarkMode ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          Image.asset("assets/images/ic_hand_waves.png"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Get a discount on all items now.",
                          style: TextStyle(
                              fontSize: 16,
                              color: _isDarkMode ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset("assets/images/ic_profile.png"),
                )
              ],
            ), //welcome back message is completed
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
              // thickness of the line
              //indent: 20, // empty space to the leading edge of divider.
              //endIndent: 20, // empty space to the trailing edge of the divider.
              color: Colors.grey, // The color to use when painting the line.
              //height: 10, // The divider's height extent.
            ),
            const SizedBox(
              height: 10,
            ),
            HorizontalList(
              isDarkMode: _isDarkMode,
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: ItemModel.itemList.length,
              itemBuilder: (context, index) {
                return CustomGridItem(
                  index: index,
                  isDarkMode: _isDarkMode,
                );
                /*Container(
                  color: Colors.blue,
                  child: Text("index: $index"),
                );*/
              },
            )
          ],
        ),
      ),
    );
  }
}
