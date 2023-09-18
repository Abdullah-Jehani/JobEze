import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/theme_provider.dart';
import 'package:job_eze/screens/secondary/profile_screen.dart';
import 'package:job_eze/screens/secondary/settings_screen.dart';
import 'package:provider/provider.dart';

import '../Home/home_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int cureentIndex = 0;
  final tabs = const [HomeScreen(), ProfileScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        body: tabs[cureentIndex],
        bottomNavigationBar: Container(
          color: themeProvider.currentTheme ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: GNav(
              backgroundColor:
                  themeProvider.currentTheme ? Colors.black : Colors.white,
              color: mainFont,
              activeColor: mainFont,
              onTabChange: (index) {
                setState(() {
                  cureentIndex = index;
                });
                // Navigator.push(context,
                //     CupertinoPageRoute(builder: (context) => tabs[index]));
              },
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  iconSize: 28,
                  iconColor: mainFont,
                  iconActiveColor:
                      themeProvider.currentTheme ? Colors.white : purpleColor,
                ),
                GButton(
                  icon: Icons.person_outline_outlined,
                  iconSize: 28,
                  iconColor: mainFont,
                  iconActiveColor:
                      themeProvider.currentTheme ? Colors.white : purpleColor,
                ),
                GButton(
                  icon: Icons.settings,
                  iconColor: mainFont,
                  iconSize: 24,
                  iconActiveColor:
                      themeProvider.currentTheme ? Colors.white : purpleColor,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
