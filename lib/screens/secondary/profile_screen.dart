import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/pajamas.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/vaadin.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/theme_provider.dart';
import 'package:job_eze/providers/user_detail_provider.dart';
import 'package:job_eze/widgets/custom_experties_tag.dart';
import 'package:job_eze/widgets/custom_personal_info.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<UserDetailProvider>(context, listen: false).fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDetailProvider>(
        builder: (context, userDetailConsumer, child) {
      return Consumer<ThemeProvider>(builder: (context, themeConsumer, child) {
        return Scaffold(
          body: userDetailConsumer.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: mainFont,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/images (1).jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Column(
                                children: [
                                  Text(
                                    'Abdullah Jehani',
                                    style: TextStyle(
                                        color: themeConsumer.currentTheme
                                            ? lightPurbleColor
                                            : mainFont,
                                        fontFamily: 'poppins',
                                        fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Software Engineering',
                                      style: TextStyle(
                                        color: themeConsumer.currentTheme
                                            ? purpleColor
                                            : secondaryFont,
                                        fontFamily: 'poppins',
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Iconify(
                              Ic.twotone_settings,
                              color: purpleColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomExpertiesTag(
                              text: 'UI/UX \n Designer',
                              color: Color(0xFFFF735C),
                            ),
                            CustomExpertiesTag(
                              text: 'Frontend \n Engineer',
                              color: Color(0xFF41A87E),
                            ),
                            CustomExpertiesTag(
                              text: 'Mobile \n Development',
                              color: Color(0xFF3E3E59),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomProfileInfo(
                            icon: Iconify(Pajamas.location),
                            text: 'Benghazi , Libya'),
                        const SizedBox(
                          height: 25,
                        ),
                        const CustomProfileInfo(
                            icon: Iconify(Vaadin.office), text: 'Not Working'),
                        const SizedBox(
                          height: 25,
                        ),
                        const CustomProfileInfo(
                            icon: Iconify(Ph.phone), text: '+218 92 00000001'),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () async {
                            launcher.launchUrl(
                              Uri.parse(''.toString()),
                              mode: launcher.LaunchMode.externalApplication,
                            );
                          },
                          child: const CustomProfileInfo(
                              icon: Iconify(Ic.email),
                              text: 'abdallahaljehani926@gmail.com'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () async {
                            launcher.launchUrl(
                              Uri.parse('https://github.com/Abdullah-Jehani'
                                  .toString()),
                              mode: launcher.LaunchMode.externalApplication,
                            );
                          },
                          child: const CustomProfileInfo(
                              icon: Iconify(Ph.link_thin),
                              text: 'github/Abdullah-Jehani'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const CustomProfileInfo(
                            icon: Iconify(Mdi.resume), text: 'my_resume.pdf'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'About Me',
                          style: TextStyle(
                              color: themeConsumer.currentTheme
                                  ? lightPurbleColor
                                  : mainFont.withOpacity(.7),
                              fontFamily: 'poppins',
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: themeConsumer.currentTheme
                                    ? purpleColor.withOpacity(.5)
                                    : secondaryFont.withOpacity(.1)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release. ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: themeConsumer.currentTheme
                                      ? secondaryFont.withOpacity(.8)
                                      : const Color(0xFF808080),
                                  fontSize: 14,
                                  fontFamily: 'poppins'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      });
    });
  }
}
