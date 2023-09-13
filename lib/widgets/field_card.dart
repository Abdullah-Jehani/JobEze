import 'package:flutter/cupertino.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/screens/Home/job_lists_screen.dart';

class FieldCard extends StatefulWidget {
  const FieldCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.height,
    required this.width,
    required this.buttom,
    required this.left,
  });

  final String title;
  final String subTitle;
  final String image;
  final double height;
  final double width;
  final double buttom;
  final double left;

  @override
  State<FieldCard> createState() => _FieldCardState();
}

class _FieldCardState extends State<FieldCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const JobListScreen()));
      },
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: size.width * 0.86,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: mainFont,
                    ),
                  ],
                  color: lightPurbleColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              color: mainFont,
                              fontFamily: 'poppins',
                              fontSize: 18),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.subTitle,
                            maxLines: 3,
                            style: TextStyle(
                                color: secondaryFont,
                                fontFamily: 'poppins',
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: widget.buttom,
            left: widget.left,
            child: Image.asset(
              widget.image,
              height: widget.height,
              width: widget.width,
            ),
          )
        ],
      ),
    );
  }
}
