import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ep.dart';
import 'package:job_eze/widgets/GetStarted/dots_widget.dart';

// ignore: must_be_immutable
class MainStartedWidget extends StatefulWidget {
  MainStartedWidget(
      {super.key,
      required this.img,
      required this.header,
      required this.paragraph,
      required this.colors,
      required this.onClickNext,
      required this.onClickSkip,
      this.textButton});

  final String img;
  final String header;
  final String paragraph;
  List colors = [Color, Color, Color];
  final Function onClickNext;
  final Function onClickSkip;
  String? textButton;

  @override
  State<MainStartedWidget> createState() => _MainStartedWidgetState();
}

class _MainStartedWidgetState extends State<MainStartedWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xFF202040),
      child: Column(
        children: [
          SizedBox(
            height: size.height * .14,
          ),
          Image.asset(
            'assets/images/${widget.img}',
            width: size.width * 80,
            height: size.height * .38,
          ),
          SizedBox(
            height: size.height * .001,
          ),
          Text(
            widget.header,
            style: const TextStyle(
                color: Color(0xFFB2B3FF),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * .04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              widget.paragraph,
              style: const TextStyle(color: Color(0xFFC4D6EB), fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * .05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .37),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DotsWidget(color: widget.colors[0]),
                DotsWidget(color: widget.colors[1]),
                DotsWidget(color: widget.colors[2]),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .06,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onClickSkip();
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      widget.onClickNext();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFB2B3FF),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .045,
                                vertical: size.height * .0091),
                            child: Text(
                              widget.textButton ?? 'Next',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'poppins',
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: size.width * .02),
                            child: const Iconify(
                              Ep.arrow_right,
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
