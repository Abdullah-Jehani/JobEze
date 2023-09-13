import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.backColor,
    required this.textColor,
    this.onPressed,
    // required this.size
  });

  final Color backColor;
  final Icon icon;
  final String text;
  final Color color;
  final Color textColor;
  final Function? onPressed;
  // final Size size;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            widget.backColor,
          ),
        ),
        child: Row(
          children: [
            Icon(widget.icon.icon, color: widget.color, size: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Text(
                widget.text,
                style: TextStyle(
                    color: widget.textColor,
                    fontFamily: 'poppins',
                    fontSize: 12),
              ),
            )
          ],
        ),
        onPressed: () {
          setState(() {
            widget.onPressed!();
          });
        },
      ),
    );
  }
}
