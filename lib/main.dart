import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OShop',
      theme: ThemeData.light(),
      themeMode: _themeMode,
      darkTheme: ThemeData.dark(),
      home: DashboardScreen(
        currentThemeMode: _themeMode,
        onThemeChanged: (bool mode) {
          _toggleTheme(mode);
        },
      ),
    );
  }
}
