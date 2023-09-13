import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/screens/profile_screen.dart';
import 'package:job_eze/screens/settings_screen.dart';

import 'home_screen.dart';

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
        color: lightPurbleColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: GNav(
            backgroundColor: lightPurbleColor,
            color: mainFont,
            activeColor: Colors.white,
            tabBackgroundColor: purpleColor,
            gap: 8,
            onTabChange: (index) {
              setState(() {
                cureentIndex = index;
              });
              // Navigator.push(context,
              //     CupertinoPageRoute(builder: (context) => tabs[index]));
            },
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            tabs: [
              GButton(
                active: true,
                icon: Icons.home,
                text: 'Home',
                iconSize: 24,
                iconColor: mainFont,
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                iconSize: 24,
                iconColor: mainFont,
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
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
