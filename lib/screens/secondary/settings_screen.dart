import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/dashicons.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/jam.dart';
import 'package:iconify_flutter/icons/ooui.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/main.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/secondary/profile_screen.dart';
import 'package:job_eze/widgets/custom_settings.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Settings',
            style:
                TextStyle(color: mainFont, fontSize: 24, fontFamily: 'poppins'),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const ProfileScreen()),
                  (route) => false);
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    width: size.width * 0.86,
                    height: size.height * 0.13,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainFont),
                      boxShadow: [
                        BoxShadow(
                          color: mainFont,
                        ),
                      ],
                      color: lightPurbleColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: purpleColor, width: 3),
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/images (1).jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, top: 20),
                                  child: Text(
                                    'Abdullah Jehani',
                                    style: TextStyle(
                                        color: mainFont,
                                        fontFamily: 'poppins',
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 70),
                                  child: Text(
                                    '0940000615',
                                    style: TextStyle(
                                        color: secondaryFont,
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Iconify(
                            Ooui.next_ltr,
                            color: mainFont,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          shape: BoxShape.circle,
                          color: const Color(0xFFFFEA20)),
                    ),
                    Iconify(
                      Dashicons.admin_appearance,
                      color: mainFont,
                      size: 22,
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Dark Mode',
                  style: TextStyle(
                      color: Color(0xFF808080),
                      fontFamily: 'poppins',
                      fontSize: 15),
                ),
                const SizedBox(
                  width: 135,
                ),
                Switch(
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomSettings(
              backColor: Color(0xFFFF735C),
              icon: Iconify(Ion.notifcations),
              text: 'Notifications'),
          const SizedBox(
            height: 10,
          ),
          const CustomSettings(
              backColor: Color(0xFF9797F8),
              icon: Iconify(Ph.key),
              text: 'Security'),
          const SizedBox(
            height: 30,
          ),
          const CustomSettings(
              backColor: Color(0xFF41A87E),
              icon: Iconify(Ic.settings),
              text: 'App Settings'),
          const SizedBox(
            height: 10,
          ),
          const CustomSettings(
              backColor: Color(0xFF4A4AFF),
              icon: Iconify(Ic.language),
              text: 'Languages'),
          const SizedBox(
            height: 30,
          ),
          const CustomSettings(
              backColor: Color(0xFFFFEA20),
              icon: Iconify(Jam.message_alt),
              text: 'Support'),
          const SizedBox(
            height: 10,
          ),
          const CustomSettings(
              backColor: Color(0xFFFF735C),
              icon: Iconify(
                Ph.book_thin,
                size: 24,
              ),
              text: 'FAQ'),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                        colors: [Color(0xFFB41FF6), Color(0xFF771ED4)])),
                child: TextButton(
                    onPressed: () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .logout()
                          .then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const ScreenRouter()),
                            (route) => false);
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'poppins',
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Iconify(
                          RadixIcons.exit,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
