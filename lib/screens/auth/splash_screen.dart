import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _logoAnimation;

  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _logoAnimation = Tween<Alignment>(
      begin: Alignment.bottomRight,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const ScreenRouter()),
      );
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showText = true;
        });
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width * 1,
        decoration: BoxDecoration(
          color: mainFont,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _logoAnimation,
              builder: (context, child) {
                return Align(
                  alignment: _logoAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/Screenshot_2023-09-26_231320-removebg-preview.png',
                height: 180,
                width: 180,
              ),
            ),
            if (_showText)
              const Positioned(
                top: 430,
                child: Text(
                  'JobEze',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
