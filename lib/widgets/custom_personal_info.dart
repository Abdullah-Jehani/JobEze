import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/theme_provider.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ThemeProvider>(builder: (context, themeConsumer, child) {
      return Row(
        children: [
          Iconify(
            widget.icon.icon,
            color: themeConsumer.currentTheme ? purpleColor : mainFont,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: themeConsumer.currentTheme
                    ? lightPurbleColor.withOpacity(.7)
                    : mainFont.withOpacity(.4),
                fontFamily: 'poppins',
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    });
  }
}
