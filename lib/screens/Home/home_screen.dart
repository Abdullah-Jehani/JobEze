import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/providers/job_provider.dart';
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
      return Consumer<JobProvider>(builder: (context, job, child) {
        return Scaffold(
          body: job.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
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
                            authConsumer.userModel!.name,
                            style: TextStyle(
                                color: mainFont,
                                fontFamily: 'poppins',
                                fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
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
                      const SizedBox(
                        height: 10,
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
                                    backgroundColor: MaterialStateProperty.all(
                                        lightPurbleColor),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                        height: 20,
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
                                color: mainFont,
                                fontFamily: 'poppins',
                                fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
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
                            "noble field study diagnosis,treatment, and prevention of  diseases",
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
                            'software, hardware, and digital technologies that shape our modern world',
                        image: 'assets/images/coolRobot.png',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const FieldCard(
                        width: 200,
                        height: 140,
                        buttom: -10,
                        left: 230,
                        title: 'Law',
                        subTitle:
                            'rules and regulations that govern human behavior and maintain order',
                        image: 'assets/images/Lawyer-pana (1).png',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const FieldCard(
                          title: 'Engennering',
                          subTitle:
                              'Engineers use their expertise to solve real-world problems',
                          image: 'assets/images/Robot arm-cuate.png',
                          height: 165,
                          width: 160,
                          buttom: -30,
                          left: 240)
                    ],
                  ),
                ),
        );
      });
    });
  }
}
