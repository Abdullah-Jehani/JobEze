import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ooui.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomSettings extends StatefulWidget {
  const CustomSettings(
      {super.key,
      required this.backColor,
      required this.icon,
      required this.text});
  final Color backColor;
  final Iconify icon;
  final String text;
  @override
  State<CustomSettings> createState() => _CustomSettingsState();
}

class _CustomSettingsState extends State<CustomSettings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeConsumer, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                      color: widget.backColor),
                ),
                Iconify(
                  widget.icon.icon,
                  color: themeConsumer.currentTheme
                      ? mainFont.withOpacity(.9)
                      : mainFont,
                  size: 22,
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  color: themeConsumer.currentTheme
                      ? lightPurbleColor
                      : const Color(0xFF808080),
                  fontFamily: 'poppins',
                  fontSize: 15),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Iconify(
                    Ooui.next_ltr,
                    size: 16,
                    color: themeConsumer.currentTheme ? purpleColor : mainFont,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
