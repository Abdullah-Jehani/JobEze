import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInMethods extends StatefulWidget {
  const SignInMethods({
    super.key,
    required this.imageSocial,
    required this.height,
    required this.width,
  });

  final String imageSocial;
  final double height;
  final double width;
  @override
  State<SignInMethods> createState() => _SignInMethodsState();
}

class _SignInMethodsState extends State<SignInMethods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 219, 219, 219).withOpacity(.1),
        border: Border.fromBorderSide(BorderSide(
            color: const Color.fromARGB(255, 117, 117, 117).withOpacity(.1))),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: Image.asset(
            widget.imageSocial,
            width: widget.width,
            height: widget.height,
          )),
    );
  }
}
