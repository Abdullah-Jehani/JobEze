import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/screens/auth/login_screen.dart';
import 'package:job_eze/screens/secondary/startingPages/get_started_screen.dart';
import 'package:job_eze/widgets/GetStarted/main/main_started_widget.dart';

class GetStartedScreen3 extends StatefulWidget {
  const GetStartedScreen3({super.key});

  @override
  State<GetStartedScreen3> createState() => _GetStartedScreen3State();
}

class _GetStartedScreen3State extends State<GetStartedScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainStartedWidget(
          img: 'haze-learning-languages-in-the-app-1.png',
          header: 'Transform Your Job Search Experience.',
          paragraph:
              ' Discover Vast Career Opportunities Empowered by Our Multilingual Job Search App',
          colors: const [
            Color(0xFFD9D9D9),
            Color(0xFFD9D9D9),
            Color(0xFFB2B3FF)
          ],
          onClickNext: () {
            Navigator.pushAndRemoveUntil(
                context,
                (CupertinoPageRoute(builder: (context) => GetStarted())),
                (route) => false);
          },
          textButton: 'Continue',
          onClickSkip: () {}),
    );
  }
}
