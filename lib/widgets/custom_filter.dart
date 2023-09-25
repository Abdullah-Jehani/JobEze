import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:job_eze/helpers/color_helper.dart';

class CustomFilter extends StatefulWidget {
  const CustomFilter(
      {super.key,
      required this.icon,
      required this.text,
      required this.textColor,
      required this.iconColor});

  final Iconify icon;
  final String text;
  final Color textColor;
  final Color iconColor;

  @override
  State<CustomFilter> createState() => _CustomFilterState();
}

bool isSelected = false;

class _CustomFilterState extends State<CustomFilter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF87080) : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Iconify(
                widget.icon.icon,
                color: isSelected ? Colors.white : mainFont,
                size: 24,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: isSelected ? Colors.white : mainFont,
                    fontFamily: 'poppins',
                    fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
