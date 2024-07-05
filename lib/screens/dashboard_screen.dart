import 'package:flutter/material.dart';

import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen(
      {Key? key, required this.onThemeChanged, required this.currentThemeMode})
      : super(key: key);

  final Function(bool) onThemeChanged;
  final ThemeMode currentThemeMode;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isDarkMode = false;

  void _onSwitchChanged(bool value) {
    setState(() {
      _isDarkMode = value;
      //themeChangeProvider.pref.setDarkModeTheme(value);
    });
    widget.onThemeChanged(value);
  }

  int currentTab = 0;
  late final List<Widget> menuItemList;

  @override
  void initState() {
    super.initState();
    menuItemList = [
      HomeScreen(index: 0, onThemeChanged: _onSwitchChanged),
      HomeScreen(
        index: 1,
        onThemeChanged: _onSwitchChanged,
      ),
      HomeScreen(
        index: 2,
        onThemeChanged: _onSwitchChanged,
      ),
      HomeScreen(
        index: 3,
        onThemeChanged: _onSwitchChanged,
      ),
      HomeScreen(
        index: 4,
        onThemeChanged: _onSwitchChanged,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTab = index;
    });
  }

  Widget _buildIcon(int index, String icon) {
    bool isSelected = currentTab == index;
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Color(0xFFF9D2C7) : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          icon,
          color: isSelected ? Color(0xFFDD704F) : Color(0xFFBFBFBF),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: _isDarkMode ? Colors.black.withOpacity(0.8) : Color(0xFFFAFAFA),
      body: menuItemList.elementAt(currentTab),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: currentTab,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(0, "assets/images/ic_menu_home.png"),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(1, "assets/images/ic_menu_category.png"),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(2, "assets/images/ic_menu_history.png"),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(3, "assets/images/ic_menu_chat.png"),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(4, "assets/images/ic_menu_profile.png"),
                  label: '',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
