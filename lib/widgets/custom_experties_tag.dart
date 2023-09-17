import 'package:flutter/material.dart';

class CustomExpertiesTag extends StatefulWidget {
  const CustomExpertiesTag(
      {super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  State<CustomExpertiesTag> createState() => _CustomExpertiesTagState();
}

class _CustomExpertiesTagState extends State<CustomExpertiesTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        child: Flexible(
          child: Text(
            maxLines: 2,
            textAlign: TextAlign.center,
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontFamily: 'poppins', fontSize: 12),
          ),
        ),
      ),
    );
  }
}
