import 'package:flutter/material.dart';

class DotsWidget extends StatefulWidget {
  const DotsWidget({super.key, required this.color});
  final Color color;

  @override
  State<DotsWidget> createState() => _DotsWidgetState();
}

class _DotsWidgetState extends State<DotsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
      ),
    );
  }
}
