import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/secondary/startingPages/get_started_screen2.dart';

import 'package:job_eze/widgets/GetStarted/main/main_started_widget.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authConsumer, child) {
      return Scaffold(
          body: MainStartedWidget(
        img: 'haze-business-men-shaking-hands-after-signing-contract-1.png',
        header: 'Unlock your carrer Potentials with JobEze.',
        paragraph: ' a place where job opportunities meet their perfect match.',
        colors: const [Color(0xFFB2B3FF), Color(0xFFD9D9D9), Color(0xFFD9D9D9)],
        onClickNext: () {
          Provider.of<AuthProvider>(context, listen: false).setFirstTime(false);

          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                  builder: (context) => const GetStartedScreen2()),
              (route) => false);
        },
        onClickSkip: () {},
      )
          // body: Column(
          //   children: [
          //     const SizedBox(
          //       height: 90,
          //     ),

          //     const SizedBox(
          //       height: 100,
          //     ),
          //     // Image.asset(
          //     //   'assets/images/8711572.jpg',
          //     //   width: size.width * 1,
          //     //   height: size.height * .40,
          //     // ),
          //     Column(
          //       children: [
          //         SizedBox(
          //           height: size.height * .40,
          //           width: size.width * 1,
          //           child: AnotherCarousel(
          //             images: [
          //               Image.asset('assets/images/8711572.jpg'),
          //               Image.asset('assets/images/6736639.jpg'),
          //               Image.asset('assets/images/7000961.jpg'),
          //             ],
          //             dotSize: 2,
          //             dotBgColor: Colors.transparent,
          //           ),
          //         )
          //       ],
          //     ),
          //     const SizedBox(
          //       height: 50,
          //     ),
          //     const Padding(
          //       padding: EdgeInsets.only(
          //         left: 35,
          //         right: 35,
          //       ),
          //       child: Text(
          //         'Unlock your carrer potential with JobEze , where job opportunities meet their perfect match.',
          //         style: TextStyle(
          //             fontFamily: 'poppins',
          //             fontSize: 13,
          //             color: Color(0xFF4E4D4D)),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 100,
          //     ),
          //     TextButton(
          //         onPressed: () {
          //           Provider.of<AuthProvider>(context, listen: false)
          //               .setFirstTime(false);
          //           Navigator.pushReplacement(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => const LoginScreen()));
          //         },
          //         child: Container(
          //           decoration: const BoxDecoration(
          //             color: Color(0XFFFF735C),
          //             borderRadius: BorderRadius.all(
          //               Radius.circular(10),
          //             ),
          //           ),
          //           child: const Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //             child: Text(
          //               'Get Started',
          //               style:
          //                   TextStyle(color: Colors.white, fontFamily: 'poppins'),
          //             ),
          //           ),
          //         ))
          //   ],
          // ),
          );
    });
  }
}
