import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/screens/profile_screen.dart';
import 'package:job_eze/screens/settings_screen.dart';
import 'package:job_eze/widgets/field_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cureentIndex = 0;
  final tabs = const [HomeScreen(), ProfileScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 340,
                ),
                Text(
                  'Good Morning ,',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: secondaryFont),
                ),
                Text(
                  'Abdullah',
                  style: TextStyle(
                      color: mainFont, fontFamily: 'poppins', fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: lightPurbleColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search By Job, Field, and Title',
                      hintStyle: TextStyle(
                          color: secondaryFont,
                          fontFamily: 'poppins',
                          fontSize: 14),
                      suffixIcon: const Icon(Icons.search, size: 32),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: size.width * 0.86,
                  height: size.height * 0.20,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: mainFont,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: mainFont, width: 1.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'not sure where to Go ?',
                        style: TextStyle(
                          color: lightPurbleColor,
                          fontFamily: 'poppins',
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          'Get The advice of experts For Free',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainFont,
                            fontFamily: 'poppins',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(lightPurbleColor),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Consult Now',
                            style: TextStyle(
                              color: mainFont,
                              fontSize: 14,
                              fontFamily: 'poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 300,
                ),
                Text(
                  'COMMON FIELDS',
                  style: TextStyle(
                      color: secondaryFont,
                      fontFamily: 'poppins',
                      fontSize: 18,
                      letterSpacing: 1.5),
                ),
                Text(
                  ' Looking for ',
                  style: TextStyle(
                      color: mainFont, fontFamily: 'poppins', fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const FieldCard(
              width: 177,
              height: 180,
              left: 200,
              buttom: -30,
              title: 'Finance',
              subTitle:
                  'Finance play a crucial role in the functioning of economies and business',
              image: 'assets/images/Thinkingface-bro.png',
            ),
            const SizedBox(
              height: 10,
            ),
            const FieldCard(
              width: 232,
              height: 250,
              buttom: -70,
              left: 190,
              title: 'Medicine',
              subTitle:
                  "noble field study diagnosis,\ntreatment, and prevention of \n diseases",
              image: 'assets/images/AIDSResearch-bro.png',
            ),
            const SizedBox(
              height: 10,
            ),
            const FieldCard(
              width: 172,
              height: 165,
              buttom: -30,
              left: 200,
              title: 'Technology',
              subTitle:
                  'software, hardware, and\ndigital technologies that\nshape our modern world',
              image: 'assets/images/coolRobot.png',
            ),
            const SizedBox(
              height: 10,
            ),
            const FieldCard(
              width: 200,
              height: 170,
              buttom: -30,
              left: 170,
              title: 'Law',
              subTitle:
                  'rules and regulations that govern\n human behavior and maintain \n order',
              image: 'assets/images/Sheriff-bro.png',
            ),
            const SizedBox(
              height: 10,
            ),
            const FieldCard(
                title: 'Engennering',
                subTitle:
                    'Engineers use their expertise to \n solve real-world problems',
                image: 'assets/images/Construction-bro.png',
                height: 165,
                width: 200,
                buttom: -30,
                left: 240)
          ],
        ),
      ),
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
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => tabs[index]));
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
