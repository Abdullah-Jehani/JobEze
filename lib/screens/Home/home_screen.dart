import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/color_helper.dart';
import '../../widgets/field_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<AuthProvider>(builder: (context, authConsumer, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
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
                    authConsumer.userModel!.name,
                    style: TextStyle(
                        color: mainFont, fontFamily: 'poppins', fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                left: 240,
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
                left: 220,
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
                left: 240,
                title: 'Technology',
                subTitle:
                    'software, hardware, and\ndigital technologies that\nshape our modern world',
                image: 'assets/images/coolRobot.png',
              ),
              const SizedBox(
                height: 10,
              ),
              const FieldCard(
                width: 180,
                height: 140,
                buttom: -10,
                left: 230,
                title: 'Law',
                subTitle:
                    'rules and regulations that govern\n human behavior and maintain \n order',
                image: 'assets/images/Lawyer-bro.png',
              ),
              const SizedBox(
                height: 10,
              ),
              const FieldCard(
                  title: 'Engennering',
                  subTitle:
                      'Engineers use their expertise to \n solve real-world problems',
                  image: 'assets/images/Construction-rafiki.png',
                  height: 165,
                  width: 160,
                  buttom: -30,
                  left: 240)
            ],
          ),
        ),
      );
    });
  }
}
