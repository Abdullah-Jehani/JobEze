import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => const ScreenRouter()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: mainFont,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/Screenshot_2023-09-23_195743-removebg-preview.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
