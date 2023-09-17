import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/screens/secondary/profile_screen.dart';
import 'package:job_eze/screens/secondary/settings_screen.dart';

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
    return Scaffold(
      body: tabs[cureentIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: GNav(
            backgroundColor: Colors.white,
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
              ),
              GButton(
                icon: Icons.person_outline_outlined,
                iconSize: 28,
                iconColor: mainFont,
              ),
              GButton(
                icon: Icons.settings,
                iconColor: mainFont,
                iconSize: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
