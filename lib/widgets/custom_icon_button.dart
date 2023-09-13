import 'package:flutter/material.dart';
import 'package:job_eze/helpers/color_helper.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onpressed});
  final Icon icon;
  final Color color;
  final Function onpressed;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  Color currentColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: mainFont.withOpacity(.15)),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Icon(
                  widget.icon.icon,
                  color: widget.color,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          currentColor = Colors.red;
        });
      },
    );
  }
}
