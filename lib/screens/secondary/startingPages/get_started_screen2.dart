import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/screens/secondary/startingPages/get_started_screen3.dart';
import 'package:job_eze/widgets/GetStarted/main/main_started_widget.dart';

class GetStartedScreen2 extends StatefulWidget {
  const GetStartedScreen2({super.key});

  @override
  State<GetStartedScreen2> createState() => _GetStartedScreen2State();
}

class _GetStartedScreen2State extends State<GetStartedScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainStartedWidget(
          img: 'haze-searching-for-documents-in-folders.png',
          header: 'Discover jobs with our user friendly app.',
          paragraph:
              'whether you are searching for full-time, part-time, or remote positions, we have you covered.',
          colors: const [
            Color(0xFFD9D9D9),
            Color(0xFFB2B3FF),
            Color(0xFFD9D9D9)
          ],
          onClickNext: () {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                    builder: (context) => const GetStartedScreen3()),
                (route) => false);
          },
          onClickSkip: () {}),
    );
  }
}
