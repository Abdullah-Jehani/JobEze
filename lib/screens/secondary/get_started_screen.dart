import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<AuthProvider>(builder: (context, authConsumer, child) {
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 90,
            ),

            const SizedBox(
              height: 100,
            ),
            // Image.asset(
            //   'assets/images/8711572.jpg',
            //   width: size.width * 1,
            //   height: size.height * .40,
            // ),
            Column(
              children: [
                SizedBox(
                  height: size.height * .40,
                  width: size.width * 1,
                  child: AnotherCarousel(
                    images: [
                      Image.asset('assets/images/8711572.jpg'),
                      Image.asset('assets/images/6736639.jpg'),
                      Image.asset('assets/images/7000961.jpg'),
                    ],
                    dotSize: 2,
                    dotBgColor: Colors.transparent,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Text(
                'Unlock your carrer potential with JobEze , where job opportunities meet their perfect match.',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 13,
                    color: Color(0xFF4E4D4D)),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .setFirstTime(false);
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0XFFFF735C),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Get Started',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'poppins'),
                    ),
                  ),
                ))
          ],
        ),
      );
    });
  }
}
