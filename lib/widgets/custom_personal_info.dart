import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:job_eze/helpers/color_helper.dart';

class CustomProfileInfo extends StatefulWidget {
  const CustomProfileInfo({super.key, required this.icon, required this.text});
  final Iconify icon;
  final String text;

  @override
  State<CustomProfileInfo> createState() => _CustomProfileInfoState();
}

class _CustomProfileInfoState extends State<CustomProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Iconify(
          widget.icon.icon,
          color: mainFont,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.text,
          style: TextStyle(
              color: mainFont.withOpacity(.4),
              fontFamily: 'poppins',
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
